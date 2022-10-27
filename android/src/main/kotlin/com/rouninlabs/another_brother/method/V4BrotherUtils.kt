package com.rouninlabs.another_brother.method

import android.content.Context
import android.util.Log
import com.brother.sdk.lmprinter.*
import com.brother.sdk.lmprinter.setting.CustomPaperSize
import com.brother.sdk.lmprinter.setting.CustomPaperSize.PaperKind
import com.brother.sdk.lmprinter.setting.PrintImageSettings
import com.brother.sdk.lmprinter.setting.TDPrintSettings
import io.flutter.embedding.engine.plugins.FlutterPlugin

fun printSettingsFromMap(
    context: Context,
    flutterAssets: FlutterPlugin.FlutterAssets,
    map: HashMap<String, Any>
): TDPrintSettings {
    val model: PrinterModel = v4ModelFromMap(map.getMap("printerModel"))
    return when (model) {
        PrinterModel.TD_2120N,
        PrinterModel.TD_2130N,
        PrinterModel.TD_4100N,
        PrinterModel.TD_4420DN,
        PrinterModel.TD_4520DN,
        PrinterModel.TD_4550DNWB -> {
            v4TdPrintSettingsFromMap(context, model, map)
        }
        else -> {
            throw UnsupportedOperationException()
        }
    }
}

fun v4TdPrintSettingsFromMap(
    context: Context,
    model: PrinterModel,
    map: Map<String, Any>,
): TDPrintSettings {
    return TDPrintSettings(model).apply {
        workPath = context.filesDir.absolutePath
        printOrientation = v4OrientationFromMap(map.getMap("orientation"))
        numCopies = map["numberOfCopies"] as Int
        halftone = v4HalftoneFromMap(map.getMap("halftone"))
        isAutoCut = map.getBool("isAutoCut")
        isPeelLabel = map.getBool("peelMode")
        autoCutForEachPageCount = map["autoCutForEachPageCount"] as Int
        isCutAtEnd = map["isCutAtEnd"] as Boolean
        printQuality = v4PrintQualityFromMap(map.getMap("printQuality"))
        scaleValue = map.getFloat("scaleValue")
        customPaperSize = v4CustomPaperSizeFromMap(map.getMap("customPaperInfo"))
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
    return when (v4PaperKindFromMap(map.getMap("paperKind"))) {
        PaperKind.Roll -> {
            CustomPaperSize.newRollPaperSize(
                map.getFloat("tapeWidth"),
                CustomPaperSize.Margins(
                    map.getFloat("topMargin"),
                    map.getFloat("leftMargin"),
                    map.getFloat("bottomMargin"),
                    map.getFloat("rightMargin"),
                ),
                v4UnitFromMap(map.getMap("unit")),
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
                v4UnitFromMap(map.getMap("unit")),
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
                v4UnitFromMap(map.getMap("unit")),
            )
        }
        PaperKind.ByFile -> {
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

fun v4PrinterStatusMap(error: PrintError.ErrorCode): Map<String, Any?> {
    return mapOf(
        "errorCode" to mapOf(
            "id" to error.ordinal,
            "name" to error.name,
        ),
        "status" to null,
    )
}

@Suppress("UNCHECKED_CAST")
private fun Map<String, Any>.getMap(key: String): Map<String, Any> {
    return this[key] as Map<String, Any>
}

private fun Map<String, Any>.getFloat(key: String): Float {
    return (this[key] as? Double)?.toFloat() ?: 0f
}

private fun Map<String, Any>.getBool(key: String): Boolean {
    return this[key] as Boolean
}