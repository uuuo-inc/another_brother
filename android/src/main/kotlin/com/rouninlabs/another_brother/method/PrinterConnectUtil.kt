package com.brother.ptouch.sdk.printdemo.model

import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothManager
import android.content.Context
import android.hardware.usb.UsbManager
import com.brother.ptouch.sdk.Printer
import com.brother.ptouch.sdk.PrinterInfo
import com.brother.ptouch.sdk.PrinterInfo.Model
import com.brother.ptouch.sdk.PrinterInfo.Port
import com.brother.sdk.lmprinter.Channel

object PrinterConnectUtil {
    fun getCurrentChannel(context: Context, printerInfo: IPrinterInfo): Channel? {
        return when (printerInfo) {
            is UsbPrinterInfo -> Channel.newUsbChannel(context.getSystemService(Context.USB_SERVICE) as UsbManager)
            is WiFiPrinterInfo -> Channel.newWifiChannel(printerInfo.ipv4Address)
            is BluetoothPrinterInfo -> Channel.newBluetoothChannel(
                printerInfo.macAddress, getBluetoothAdapter(context)
            )
            is BLEPrinterInfo -> Channel.newBluetoothLowEnergyChannel(
                printerInfo.modelName, context, getBluetoothAdapter(context)
            )
            else -> null
        }
    }

    private fun getBluetoothAdapter(context: Context): BluetoothAdapter? {
        val manager = context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
        return manager.adapter
    }

    // v3 printSDK Printer
    fun getPrinter(context: Context, printerInfo: IPrinterInfo): Printer {
        val printer = Printer()
        val printInfo: PrinterInfo = getPrinterInfo(printerInfo)
        printer.printerInfo = printInfo
        when (printerInfo) {
            is BluetoothPrinterInfo -> {
                printer.setBluetooth(getBluetoothAdapter(context))
            }
            is BLEPrinterInfo -> {
                printer.setBluetoothLowEnergy(context, getBluetoothAdapter(context), 5000)
            }
        }
        return printer
    }

    // v3 printSDK PrinterInfo
    fun getPrinterInfo(printerInfo: IPrinterInfo): PrinterInfo {
        val info = PrinterInfo()
        info.printerModel = printerInfo.getPrinterModel()?.let { it -> Model.valueOf(it.name) }
        info.macAddress = if (printerInfo is BluetoothPrinterInfo) {
            printerInfo.macAddress
        } else ""
        when (printerInfo) {
            is BluetoothPrinterInfo -> {
                info.port = Port.BLUETOOTH
            }
            is WiFiPrinterInfo -> {
                info.port = Port.NET
            }
            is BLEPrinterInfo -> {
                info.port = Port.BLE
            }
            is UsbPrinterInfo -> {
                info.port = Port.USB
            }
        }
        info.ipAddress = if (printerInfo is WiFiPrinterInfo) printerInfo.ipv4Address else ""
        info.localName = printerInfo.modelName
        return info
    }
}
