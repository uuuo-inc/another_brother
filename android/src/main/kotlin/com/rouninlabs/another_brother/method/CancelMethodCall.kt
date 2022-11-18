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
 * Command for canceling a print in a Brother printer.
 * This support both one-time as well as the standard openCommunication/print/closeCommunication
 * approach.
 */
class CancelMethodCall(
    val flutterAssets: FlutterPlugin.FlutterAssets,
    val context: Context,
    val call: MethodCall,
    val result: MethodChannel.Result
) {
    companion object {
        const val METHOD_NAME = "cancel"
    }

    fun execute() {

        GlobalScope.launch(Dispatchers.IO) {

            val dartPrintInfo: HashMap<String, Any> =
                call.argument<HashMap<String, Any>>("printInfo")!!

            val channel = Channel.newBluetoothChannel(
                dartPrintInfo["macAddress"] as String,
                BluetoothAdapter.getDefaultAdapter(),
            )

            val generatorResult = PrinterDriverGenerator.openChannel(channel)

            if (generatorResult.error.code != OpenChannelError.ErrorCode.NoError) {
                // There was an error notify
                withContext(Dispatchers.Main) {
                    // Set result Printer status.
                    result.success(false)
                }
                return@launch
            }

            try {
                generatorResult.driver.cancelPrinting()
                withContext(Dispatchers.Main) {
                    result.success(true)
                }
            } catch (e: Exception) {
                Log.e("another-brother", "Print image error: ", e);
                withContext(Dispatchers.Main) {
                    result.success(false)
                }
            }
        }
    }
}