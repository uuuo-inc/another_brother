package com.rouninlabs.another_brother.method

import android.content.Context
import com.brother.ptouch.sdk.Printer
import com.brother.ptouch.sdk.PrinterInfo
import com.rouninlabs.another_brother.BrotherManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

/**
 * Command for getting the pages in a PDF to a Brother printer.
 * This support both one-time as well as the standard openCommunication/print/closeCommunication
 * approach.
 */
class GetPdfPagesMethodCall(
    val flutterAssets: FlutterPlugin.FlutterAssets,
    val context: Context,
    val call: MethodCall,
    val result: MethodChannel.Result
) {
    companion object {
        const val METHOD_NAME = "getPDFPages"
    }

    fun execute() {

        GlobalScope.launch(Dispatchers.IO) {

            val dartPrintInfo: HashMap<String, Any> =
                call.argument<HashMap<String, Any>>("printInfo")!!
            val printerId: String = call.argument<String>("printerId")!!
            val filePath: String = call.argument("filePath")!!

            // Decoded Printer Info
            val printInfo = printerInfofromMap(
                context = context,
                flutterAssets = flutterAssets,
                map = dartPrintInfo
            )

            // A print request is considered one-time if there was no printer tracked with this ID.
            // this will open a new connection and close it when done.
            // If it is not one-time it means someone must have already opened a connection using
            // the startCommunication() API. When endCommunication() is called that printer will be removed.
            // Create Printer
            val trackedPrinter = BrotherManager.getPrinter(printerId = printerId)
            val isOneTime: Boolean = trackedPrinter == null;
            val printer = trackedPrinter ?: Printer()

            // Prepare local connection.
            val error =
                setupConnectionManagers(context = context, printer = printer, printInfo = printInfo)
            if (error != PrinterInfo.ErrorCode.ERROR_NONE) {
                // There was an error notify
                withContext(Dispatchers.Main) {
                    result.success(-1)
                }
                return@launch
            }

            // Set Printer Info
            printer.printerInfo = printInfo

            // Start communication
            if (isOneTime) {
                // Note: Starting a communication does not seem to impact whether we can print or
                // not. Calling print without calling this seems to still print fine.
                val started: Boolean = printer.startCommunication()
            }

            val pages = printer.getPDFFilePages(filePath)

            // End Communication
            if (isOneTime) {
                val connectionClosed: Boolean = printer.endCommunication()
            }

            // Encode PrinterStatus
            withContext(Dispatchers.Main) {
                // Set result Printer status.
                result.success(pages)
            }
        }

    }
}