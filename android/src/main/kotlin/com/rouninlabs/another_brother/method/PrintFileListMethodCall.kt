package com.rouninlabs.another_brother.method

import android.bluetooth.BluetoothAdapter
import android.content.Context
import android.util.Log
import com.brother.ptouch.sdk.printdemo.model.BluetoothPrinterInfo
import com.brother.ptouch.sdk.printdemo.model.PrinterConnectUtil
import com.brother.sdk.lmprinter.Channel
import com.brother.sdk.lmprinter.OpenChannelError
import com.brother.sdk.lmprinter.PrintError.ErrorCode
import com.brother.sdk.lmprinter.PrinterDriverGenerator
import com.brother.sdk.lmprinter.PrinterDriverGenerateResult
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

            try {

                val dartPrintInfo: HashMap<String, Any> =
                    call.argument<HashMap<String, Any>>("printInfo")!!
                val filePathList: List<String> = call.argument("filePathList")!!

                // Decoded Printer Info
                val printSettings = v4PrintSettingsFromMap(context = context, map = dartPrintInfo)

                // val channel = Channel.newBluetoothChannel(
                //     dartPrintInfo["macAddress"] as String,
                //     BluetoothAdapter.getDefaultAdapter(),
                // )
                // val channel =
                // PrinterConnectUtil.getCurrentChannel(context, dartPrintInfo) ?: return context.getString((R.string.create_channel_error))
                Log.e("another-brother", "create channel")
                // Log.e("another-brother", dartPrintInfo["printerModel"] as String)
                val info = BluetoothPrinterInfo(
                    "TD_4550DNWB",
                    dartPrintInfo["macAddress"] as String,
                )
                val channel = PrinterConnectUtil.getCurrentChannel(context, info)
                Log.e("another-brother", "openChannel");
                Log.e("another-brother", dartPrintInfo["macAddress"] as String)
                Log.e("another-brother", channel.toString())
                val result: PrinterDriverGenerateResult = PrinterDriverGenerator.openChannel(channel);

                // val generatorResult = PrinterDriverGenerator.openChannel(channel)

                // Log.e("another-brother", generatorResult. );
                // Log.e("another-brother", generatorResult.error.code.toString());
                // if (generatorResult.error.code != OpenChannelError.ErrorCzrode.NoError) {
                //     // There was an error notify
                //     withContext(Dispatchers.Main) {
                //         // Set result Printer status.
                //         result.success(
                //             v4PrinterStatusMap(
                //                 // error = when (generatorResult.error.code) {
                //                 //     OpenChannelError.ErrorCode.NoError -> ErrorCode.NoError
                //                 //     OpenChannelError.ErrorCode.OpenStreamFailure -> ErrorCode.ChannelErrorStreamStatusError
                //                 //     OpenChannelError.ErrorCode.Timeout -> ErrorCode.ChannelTimeout
                //                 //     else -> ErrorCode.UnknownError
                //                 // },
                //                 // errorの場合はerror codeをログに出力
                //                 error = ErrorCode.UnknownError,

                //             ),
                //         )
                //     }
                //     return@launch
                // }
                if (result.getError().getCode() != OpenChannelError.ErrorCode.NoError) {
                    Log.e("", "Error - Open Channel: " + result.getError().getCode());
                    return@launch;
                }
                Log.e("another-brother", "generate channel success");

                // val driver = generatorResult.driver
                val driver = result.getDriver();
                val error =
                    try {
                        driver.printImage(filePathList.toTypedArray(), printSettings).code
                    } catch (e: Exception) {
                        Log.e("another-brother", "Print image error: ", e);
                        ErrorCode.UnknownError
                    }

                driver.closeChannel()

                // withContext(Dispatchers.Main) {
                //     result.success(v4PrinterStatusMap(error))
                // }
            } catch (e: Exception) {
                // withContext(Dispatchers.Main) {
                //     result.success(v4PrinterStatusMap(ErrorCode.UnknownError))
                // }
            } finally {

            }
        }
    }
}