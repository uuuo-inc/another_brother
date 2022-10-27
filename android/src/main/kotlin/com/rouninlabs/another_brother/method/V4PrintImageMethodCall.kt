package com.rouninlabs.another_brother.method

import android.bluetooth.BluetoothAdapter
import android.content.Context
import android.graphics.BitmapFactory
import android.util.Log
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
import com.brother.sdk.lmprinter.Channel as PrinterChannel

/**
 * Command for printing an image to a Brother printer.
 * This support both one-time as well as the standard openCommunication/print/closeCommunication
 * approach.
 */
class V4PrintImageMethodCall(
    val flutterAssets: FlutterPlugin.FlutterAssets,
    val context: Context,
    val call: MethodCall,
    val result: MethodChannel.Result
) {
    companion object {
        const val METHOD_NAME = "printImage"
    }

    fun execute() {

        GlobalScope.launch(Dispatchers.IO) {

            // TODO Run on background thread.
            val dartPrintInfo: HashMap<String, Any> =
                call.argument<HashMap<String, Any>>("printInfo")!!
            val imageBytes: ByteArray = call.argument<ByteArray>("imageBytes")!!
            val printerId: String = call.argument<String>("printerId")!!

            Log.e("Brother", "Image Bytes: $imageBytes - Size ${imageBytes.size}")
            // Bytes to bitmap
            val bitmap = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size)
            // Decoded Printer Info
            val printSettings = printSettingsFromMap(
                context = context,
                flutterAssets = flutterAssets,
                map = dartPrintInfo
            )
            Log.e("Brother", "PrintInfo: $dartPrintInfo")
            Log.e("Brother", "Parsed Info: ${printSettings}")
            Log.e("Brother", "Parsed Info: ${printSettings.customPaperSize.paperKind}")
            Log.e("Brother", "Parsed Info: ${printSettings.customPaperSize.width}")
            Log.e("Brother", "Parsed Info: ${printSettings.customPaperSize.length}")
            Log.e("Brother", "Parsed Info: ${printSettings.customPaperSize.gapLength}")

            // Prepare local connection.
            val channel = PrinterChannel.newBluetoothChannel(
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
                    driver.printImage(bitmap, printSettings).code
                } catch (e: Exception) {
                    Log.e("another-brother", "Print image error: ", e);
                    PrintError.ErrorCode.UnknownError
                }

            driver.closeChannel()

            // Recycle bitmap
            if (!bitmap.isRecycled) {
                bitmap.recycle()
            }


            // Encode PrinterStatus
            withContext(Dispatchers.Main) {
                // Set result Printer status.
                result.success(v4PrinterStatusMap(error))
                //result.error("Error", "Method not implemented", "")
            }
        }

    }
}