package com.rouninlabs.another_brother.method

import android.content.Context
import android.util.Log
import com.brother.sdk.lmprinter.*
import com.brother.sdk.lmprinter.setting.*
import com.brother.sdk.lmprinter.setting.CustomPaperSize.PaperKind
import com.brother.sdk.lmprinter.setting.PrintImageSettings.HorizontalAlignment
import com.brother.sdk.lmprinter.setting.PrintImageSettings.VerticalAlignment

fun v4PrintSettingsFromMap(
    context: Context,
    map: HashMap<String, Any>
): PrintSettings {
    return when (map.getMapOrNull("printerModel")?.run(::v4ModelFromMap)) {
        PrinterModel.RJ_2030,
        PrinterModel.RJ_2050,
        PrinterModel.RJ_2140,
        PrinterModel.RJ_2150,
        PrinterModel.RJ_3050,
        PrinterModel.RJ_3050Ai,
        PrinterModel.RJ_3150,
        PrinterModel.RJ_3150Ai,
        PrinterModel.RJ_3230B,
        PrinterModel.RJ_3250WB,
        PrinterModel.RJ_4030,
        PrinterModel.RJ_4030Ai,
        PrinterModel.RJ_4040,
        PrinterModel.RJ_4230B,
        PrinterModel.RJ_4250WB,
        -> {
            v4RjPrintSettingsFromMap(context, map)
        }
        PrinterModel.TD_2020,
        PrinterModel.TD_2120N,
        PrinterModel.TD_2130N,
        PrinterModel.TD_4000,
        PrinterModel.TD_4100N,
        PrinterModel.TD_4410D,
        PrinterModel.TD_4510D,
        PrinterModel.TD_4420DN,
        PrinterModel.TD_4520DN,
        PrinterModel.TD_4550DNWB,
        -> {
            v4TdPrintSettingsFromMap(context, map)
        }
        else -> {
            throw UnsupportedOperationException()
        }
    }
}

fun v4TdPrintSettingsFromMap(
    context: Context,
    map: Map<String, Any>,
): TDPrintSettings {
    return TDPrintSettings(map.getMapOrNull("printerModel")?.run(::v4ModelFromMap)).apply {
        workPath = context.filesDir.absolutePath
        printOrientation = map.getMapOrNull("orientation")?.run(::v4OrientationFromMap)
        numCopies = map["numberOfCopies"] as Int
        halftone = map.getMapOrNull("halftone")?.run(::v4HalftoneFromMap)
        isAutoCut = map.getBoolOrNull("isAutoCut") ?: false
        isPeelLabel = map.getBoolOrNull("peelMode") ?: false
        map.getIntOrNull("autoCutForEachPageCount")?.let { autoCutForEachPageCount = it }
        isCutAtEnd = map.getBoolOrNull("isCutAtEnd") ?: false
        printQuality = map.getMapOrNull("printQuality")?.run(::v4PrintQualityFromMap)
        scaleValue = map.getFloat("scaleValue")
        printOrientation = map.getMapOrNull("orientation")?.run(::v4OrientationFromMap)
        customPaperSize = map.getMapOrNull("customPaperInfo")?.run(::v4CustomPaperSizeFromMap)
    }
}

fun v4RjPrintSettingsFromMap(
    context: Context,
    map: Map<String, Any>,
): RJPrintSettings {
    /*
    * TODO:
    *   - scaleMode
    * */
    return RJPrintSettings(map.getMapOrNull("printerModel")?.run(::v4ModelFromMap)).apply {
        workPath = context.filesDir.absolutePath
        scaleValue = map.getFloat("scaleValue")
        printOrientation = map.getMapOrNull("orientation")?.run(::v4OrientationFromMap)
        halftone = map.getMapOrNull("halftone")?.run(::v4HalftoneFromMap)
        hAlignment = map.getMapOrNull("align")?.run(::v4HorizontalAlignmentFromMap)
        vAlignment = map.getMapOrNull("valign")?.run(::v4VerticalAlignmentFromMap)
        isPeelLabel = map.getBoolOrNull("peelMode") ?: false
        customPaperSize = map.getMapOrNull("customPaperInfo")?.run(::v4CustomPaperSizeFromMap)
    }
}

fun v4ModelFromMap(map: Map<String, Any>): PrinterModel {
    val name: String = map["name"] as String
    return PrinterModel.valueOf(name)
}

fun v4OrientationFromMap(map: Map<String, Any>): PrintImageSettings.Orientation {
    return when (map["name"] as String) {
        "PORTRAIT" -> PrintImageSettings.Orientation.Portrait
        "LANDSCAPE" -> PrintImageSettings.Orientation.Landscape
        else -> throw UnsupportedOperationException()
    }
}

fun v4HalftoneFromMap(map: Map<String, Any>): PrintImageSettings.Halftone {
    return when (map["name"] as String) {
        "PATTERNDITHER" -> PrintImageSettings.Halftone.PatternDither
        "ERRORDIFFUSION" -> PrintImageSettings.Halftone.ErrorDiffusion
        "THRESHOLD" -> PrintImageSettings.Halftone.Threshold
        else -> throw UnsupportedOperationException()
    }
}

fun v4PrintQualityFromMap(map: Map<String, Any>): PrintImageSettings.PrintQuality {
    return when (map["name"] as String) {
        "LOW_RESOLUTION" -> PrintImageSettings.PrintQuality.Fast
        "NORMAL" -> PrintImageSettings.PrintQuality.Best
        "DOUBLE_SPEED" -> PrintImageSettings.PrintQuality.Fast
        "HIGH_RESOLUTION" -> PrintImageSettings.PrintQuality.Best
        else -> throw UnsupportedOperationException()
    }
}

fun v4CustomPaperSizeFromMap(map: Map<String, Any>): CustomPaperSize {
//    {paperKind={name=DIE_CUT}, markPosition=0.0, printerModel={name=TD_4550DNWB, id=65}, unit={name=Mm}, leftMargin=2.0, topMargin=0.0, rightMargin=2.0, markHeight=0.0, tapeWidth=80.0, bottomMargin=0.0, tapeLength=115.0, labelPitch=3.0}

    Log.d("V4BrotherUtils", "customPaperSizeMap=${map}")
    return when (map.getMapOrNull("paperKind")?.run(::v4PaperKindFromMap)) {
        PaperKind.Roll -> {
            CustomPaperSize.newRollPaperSize(
                map.getFloat("tapeWidth"),
                CustomPaperSize.Margins(
                    map.getFloat("topMargin"),
                    map.getFloat("leftMargin"),
                    map.getFloat("bottomMargin"),
                    map.getFloat("rightMargin"),
                ),
                map.getMapOrNull("unit")?.run(::v4UnitFromMap),
            )
        }
        PaperKind.DieCut -> {
            CustomPaperSize.newDieCutPaperSize(
                map.getFloat("tapeWidth"),
                map.getFloat("tapeLength"),
                CustomPaperSize.Margins(
                    map.getFloat("topMargin"),
                    map.getFloat("leftMargin"),
                    map.getFloat("bottomMargin"),
                    map.getFloat("rightMargin"),
                ),
                map.getFloat("labelPitch"),
                map.getMapOrNull("unit")?.run(::v4UnitFromMap),
            )
        }
        PaperKind.MarkRoll -> {
            CustomPaperSize.newMarkRollPaperSize(
                map.getFloat("tapeWidth"),
                map.getFloat("tapeLength"),
                CustomPaperSize.Margins(
                    map.getFloat("topMargin"),
                    map.getFloat("leftMargin"),
                    map.getFloat("bottomMargin"),
                    map.getFloat("rightMargin"),
                ),
                map.getFloat("markPosition"),
                map.getFloat("markHeight"),
                map.getMapOrNull("unit")?.run(::v4UnitFromMap),
            )
        }
        PaperKind.ByFile -> {
            throw UnsupportedOperationException()
        }
        else -> {
            throw UnsupportedOperationException()
        }
    }
}

fun v4PaperKindFromMap(map: Map<String, Any>): PaperKind {
    return when (map["name"]) {
        "ROLL" -> PaperKind.Roll
        "DIE_CUT" -> PaperKind.DieCut
        "MARKED_ROLL" -> PaperKind.MarkRoll
        else -> throw Exception("Unknown PaperKind: ${map["name"]}")
    }
}

fun v4UnitFromMap(map: Map<String, Any>): CustomPaperSize.Unit {
    return when (map["name"]) {
        "Inch" -> CustomPaperSize.Unit.Inch
        "Mm" -> CustomPaperSize.Unit.Mm
        else -> throw Exception("Unknown CustomPaperSize.Unit: ${map["name"]}")
    }
}

fun v4HorizontalAlignmentFromMap(map: Map<String, Any>): HorizontalAlignment {
    return when (map["name"]) {
        "LEFT" -> HorizontalAlignment.Left
        "CENTER" -> HorizontalAlignment.Center
        "RIGHT" -> HorizontalAlignment.Right
        else -> throw UnsupportedOperationException()
    }
}

fun v4VerticalAlignmentFromMap(map: Map<String, Any>): VerticalAlignment {
    return when (map["name"]) {
        "TOP" -> VerticalAlignment.Top
        "MIDDLE" -> VerticalAlignment.Center
        "BOTTOM" -> VerticalAlignment.Bottom
        else -> throw UnsupportedOperationException()
    }
}

fun v4PrinterStatusMap(error: PrintError.ErrorCode): Map<String, Any?> {
    return mapOf(
        "errorCode" to mapOf(
            "id" to error.ordinal,
            "name" to error.name,
        ),
        "status" to null,
        "labelId" to -1,
        "labelType" to -1,
        "isACConnected" to mapOf(
            "id" to -1,
            "name" to "Unknown",
        ),
        "isBatteryMounted" to mapOf(
            "id" to -1,
            "name" to "Unknown",
        ),
        "batteryLevel" to -1,
        "batteryResidualQuantityLevel" to -1,
        "maxOfBatteryResidualQuantityLevel" to -1,
    )
}

@Suppress("UNCHECKED_CAST")
private fun Map<String, Any>.getMapOrNull(key: String): Map<String, Any>? {
    return this[key] as? Map<String, Any>
}

private fun Map<String, Any>.getFloat(key: String): Float {
    return (this[key] as? Double)?.toFloat() ?: 0f
}

private fun Map<String, Any>.getIntOrNull(key: String): Int? {
    return this[key] as? Int
}

private fun Map<String, Any>.getBoolOrNull(key: String): Boolean? {
    return this[key] as? Boolean
}