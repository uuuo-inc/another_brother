package com.brother.ptouch.sdk.printdemo.model

import android.os.Parcelable
import com.brother.sdk.lmprinter.Channel
import com.brother.sdk.lmprinter.PrinterModel
import kotlinx.parcelize.Parcelize

interface IPrinterInfo {
    var channelType: Channel.ChannelType
    var modelName: String

    fun getPrinterModel(): PrinterModel? {
        return guessPrinterModel(modelName)
    }
}

fun guessPrinterModel(modelName: String): PrinterModel? {
    var model: PrinterModel? = null
    PrinterModel.values().forEach {
        if (modelName.lowercase().contains(it.name.lowercase().replace("_", "-"))) {
            if (it.name.length >= (model?.name?.length ?: 0)) {
                model = it
            }
        }
    }
    return model
}

@Parcelize
class WiFiPrinterInfo(
    override var modelName: String,
    var ipv4Address: String,
    override var channelType: Channel.ChannelType = Channel.ChannelType.Wifi
) : IPrinterInfo, Parcelable

@Parcelize
class BluetoothPrinterInfo(
    override var modelName: String,
    var macAddress: String,
    override var channelType: Channel.ChannelType = Channel.ChannelType.Bluetooth
) : IPrinterInfo, Parcelable

@Parcelize
class BLEPrinterInfo(
    override var modelName: String,
    override var channelType: Channel.ChannelType = Channel.ChannelType.BluetoothLowEnergy
) : IPrinterInfo, Parcelable

@Parcelize
class UsbPrinterInfo(
    override var modelName: String,
    override var channelType: Channel.ChannelType = Channel.ChannelType.USB
) : IPrinterInfo, Parcelable

enum class PrinterInfoType {
    FirmVersion, Serial, Status, SystemReport, MediaVersion, Battery
}
