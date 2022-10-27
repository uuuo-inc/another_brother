package com.rouninlabs.another_brother.method

import android.bluetooth.BluetoothAdapter
import android.content.Context
import android.util.Log
import com.brother.sdk.lmprinter.Channel
import com.brother.sdk.lmprinter.OpenChannelError
import com.brother.sdk.lmprinter.PrintError
import com.brother.sdk.lmprinter.PrinterDriverGenerator
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

/**
 * Command for printing a list of files to a Brother printer.
 * This support both one-time as well as the standard openCommunication/print/closeCommunication
 * approach.
 */
class PrintFileListMethodCall(
    val flutterAssets: FlutterPlugin.FlutterAssets,
    val context: Context,
    val call: MethodCall,
    val result: MethodChannel.Result
) {
    companion object {
        const val METHOD_NAME = "printFileList"
    }

    fun execute() {

        GlobalScope.launch(Dispatchers.IO) {

            val dartPrintInfo: HashMap<String, Any> =
                call.argument<HashMap<String, Any>>("printInfo")!!
            val filePathList: List<String> = call.argument("filePathList")!!

            // Decoded Printer Info
            val printSettings = printSettingsFromMap(context = context, map = dartPrintInfo)

            val channel = Channel.newBluetoothChannel(
                dartPrintInfo["macAddress"] as String,
                BluetoothAdapter.getDefaultAdapter(),
            )
            val generatorResult = PrinterDriverGenerator.openChannel(channel)

            if (generatorResult.error.code != OpenChannelError.ErrorCode.NoError) {
                // There was an error notify
                withContext(Dispatchers.Main) {
                    // Set result Printer status.
                    result.success(v4PrinterStatusMap(error = PrintError.ErrorCode.PrinterStatusErrorCommunicationError))
                }
                return@launch
            }

            val driver = generatorResult.driver
            val error =
                try {
                    driver.printImage(filePathList.toTypedArray(), printSettings).code
                } catch (e: Exception) {
                    Log.e("another-brother", "Print image error: ", e);
                    PrintError.ErrorCode.UnknownError
                }

            driver.closeChannel()

            // Encode PrinterStatus
            withContext(Dispatchers.Main) {
                // Set result Printer status.
                result.success(v4PrinterStatusMap(error))
                //result.error("Error", "Method not implemented", "")
            }
        }

    }
}