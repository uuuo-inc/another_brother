//
//  BrotherUtils.m
//  another_brother
//
//  Created by admin on 4/11/21.
//

#import <Foundation/Foundation.h>

#import "BrotherUtils.h"

@implementation BrotherUtils

static NSObject<FlutterPluginRegistrar>* _registrarFlutter;

+ (NSObject<FlutterPluginRegistrar>*) registrarFlutter {
  return _registrarFlutter;
}

+ (void)setRegistrarFlutter:(NSObject<FlutterPluginRegistrar>*)newRegistrar {
  if (newRegistrar != _registrarFlutter) {
      _registrarFlutter = newRegistrar;//[newRegistrar copy];
  }
}

+ (BRLMChannelType) portFromMapWithValue:(NSMutableDictionary<NSString *, NSObject *>*) map {
    NSString * name = (NSString *) [map objectForKey:@"name"];
    if ([@"BLUETOOTH" isEqualToString:name]) {
        return BRLMChannelTypeBluetoothMFi;
    }
    else if ([@"NET" isEqualToString:name]) {
        return BRLMChannelTypeWiFi;
    }
    else if ([@"BLE" isEqualToString:name]) {
        return BRLMChannelTypeBluetoothLowEnergy;
    }
    else {
        return BRLMChannelTypeWiFi;
    }
}

+ (BRLMPrinterModel)modelFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    NSString *  name = (NSString *) [map objectForKey:@"name"];
    if ([@"MW_140BT" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"MW_145BT" isEqualToString:name]) {
        return BRLMPrinterModelMW_145MFi;
    }
    else if([@"MW_260" isEqualToString:name]) {
        return BRLMPrinterModelMW_260MFi;
    }
    else if([@"PJ_522" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_523" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_520" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_560" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_562" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_563" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_622" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_623" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_662" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_663" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"RJ_4030" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
        //return BRLMPrinterModelRJ_4030Ai;
    }
    else if([@"RJ_4040" isEqualToString:name]) {
        return BRLMPrinterModelRJ_4040;
    }
    else if([@"RJ_3150" isEqualToString:name]) {
        return BRLMPrinterModelRJ_3150;
    }
    else if([@"RJ_3050" isEqualToString:name]) {
        return BRLMPrinterModelRJ_3050;
    }
    else if([@"QL_580N" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"QL_710W" isEqualToString:name]) {
        return BRLMPrinterModelQL_710W;
    }
    else if([@"QL_720NW" isEqualToString:name]) {
        return BRLMPrinterModelQL_720NW;
    }
    else if([@"TD_2020" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"TD_2120N" isEqualToString:name]) {
        return BRLMPrinterModelTD_2120N;
    }
    else if([@"TD_2130N" isEqualToString:name]) {
        return BRLMPrinterModelTD_2130N;
    }
    else if([@"PT_E550W" isEqualToString:name]) {
        return BRLMPrinterModelPT_E550W;
    }
    else if([@"PT_P750W" isEqualToString:name]) {
        return BRLMPrinterModelPT_P750W;
    }
    else if([@"TD_4100N" isEqualToString:name]) {
        return BRLMPrinterModelTD_4100N;
    }
    else if([@"TD_4000" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_762" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_763" isEqualToString:name]) {
        return BRLMPrinterModelPJ_763MFi;
    }
    else if([@"PJ_773" isEqualToString:name]) {
        return BRLMPrinterModelPJ_773;
    }
    else if([@"PJ_722" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_723" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"PJ_763MFi" isEqualToString:name]) {
        return BRLMPrinterModelPJ_763MFi;
    }
    else if([@"MW_145MFi" isEqualToString:name]) {
        return BRLMPrinterModelMW_145MFi;
    }
    else if([@"MW_260MFi" isEqualToString:name]) {
        return BRLMPrinterModelMW_260MFi;
    }
    else if([@"PT_P300BT" isEqualToString:name]) {
        return BRLMPrinterModelPT_P300BT;
    }
    else if([@"PT_E850TKW" isEqualToString:name]) {
        return BRLMPrinterModelPT_E850TKW;
    }
    else if([@"PT_D800W" isEqualToString:name]) {
        return BRLMPrinterModelPT_D800W;
    }
    else if([@"PT_P900W" isEqualToString:name]) {
        return BRLMPrinterModelPT_P900W;
    }
    else if([@"PT_P950NW" isEqualToString:name]) {
        return BRLMPrinterModelPT_P950NW;
    }
    else if([@"RJ_4030Ai" isEqualToString:name]) {
        return BRLMPrinterModelRJ_4030Ai;
    }
    else if([@"PT_E800W" isEqualToString:name]) {
        return BRLMPrinterModelPT_E800W;
    }
    else if([@"RJ_2030" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"RJ_2050" isEqualToString:name]) {
        return BRLMPrinterModelRJ_2050;
    }
    else if([@"RJ_2140" isEqualToString:name]) {
        return BRLMPrinterModelRJ_2140;
    }
    else if([@"RJ_2150" isEqualToString:name]) {
        return BRLMPrinterModelRJ_2150;
    }
    else if([@"RJ_3050Ai" isEqualToString:name]) {
        return BRLMPrinterModelRJ_3050Ai;
    }
    else if([@"RJ_3150Ai" isEqualToString:name]) {
        return BRLMPrinterModelRJ_3150Ai;
    }
    else if([@"QL_800" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"QL_810W" isEqualToString:name]) {
        return BRLMPrinterModelQL_810W;
    }
    else if([@"QL_820NWB" isEqualToString:name]) {
        return BRLMPrinterModelQL_820NWB;
    }
    else if([@"QL_1100" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"QL_1110NWB" isEqualToString:name]) {
        return BRLMPrinterModelQL_1110NWB;
    }
    else if([@"QL_1115NWB" isEqualToString:name]) {
        return BRLMPrinterModelQL_1115NWB;
    }
    else if([@"PT_P710BT" isEqualToString:name]) {
        return BRLMPrinterModelPT_P710BT;
    }
    else if([@"PT_E500" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"RJ_4230B" isEqualToString:name]) {
        return BRLMPrinterModelRJ_4230B;
    }
    else if([@"RJ_4250WB" isEqualToString:name]) {
        return BRLMPrinterModelRJ_4250WB;
    }
    else if([@"TD_4410D" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"TD_4420DN" isEqualToString:name]) {
        return BRLMPrinterModelTD_4420DN;
    }
    else if([@"TD_4510D" isEqualToString:name]) {
        return BRLMPrinterModelUnknown;
    }
    else if([@"TD_4520DN" isEqualToString:name]) {
        return BRLMPrinterModelTD_4520DN;
    }
    else if([@"TD_4550DNWB" isEqualToString:name]) {
        return BRLMPrinterModelTD_4550DNWB;
    }
    else if([@"MW_170" isEqualToString:name]) {
        return BRLMPrinterModelMW_170;
    }
    else if([@"MW_270" isEqualToString:name]) {
        return BRLMPrinterModelMW_270;
    }
    else if([@"PT_P715eBT" isEqualToString:name]) {
        return BRLMPrinterModelPT_P715eBT;
    }
    else if([@"PT_P910BT" isEqualToString:name]) {
        return BRLMPrinterModelPT_P910BT;
    }
    else if([@"RJ_3250WB" isEqualToString:name]) {
        return BRLMPrinterModelRJ_3250WB;
    }
    
    return BRLMPrinterModelUnknown;
    
}

+ (BRLMPrintSettingsHalftone)halftoneFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString *)[map objectForKey:@"name"];
    
    if ([@"THRESHOLD" isEqualToString:name]) {
        return BRLMPrintSettingsHalftoneThreshold;
    }
    else if ([@"PATTERNDITHER" isEqualToString:name]){
        return BRLMPrintSettingsHalftonePatternDither;
    }
    else if ([@"ERRORDIFFUSION" isEqualToString:name]) {
        return BRLMPrintSettingsHalftoneErrorDiffusion;
    }
    
    return BRLMPrintSettingsHalftoneErrorDiffusion;
    
}

+ (BRLMPrintSettingsHorizontalAlignment)alignFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    NSString * name = (NSString * )[map objectForKey:@"name"];
    
    if([@"LEFT" isEqualToString:name]) {
        return BRLMPrintSettingsHorizontalAlignmentLeft;
    }
    else if([@"CENTER" isEqualToString:name]) {
        return BRLMPrintSettingsHorizontalAlignmentCenter;
    }
    else if([@"RIGHT" isEqualToString:name]) {
        return BRLMPrintSettingsHorizontalAlignmentRight;
    }
    
    return BRLMPrintSettingsHorizontalAlignmentLeft;
}

+ (BRLMPrintSettingsVerticalAlignment)vAlignFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString *) [map objectForKey:@"name"];
    
    if([@"TOP" isEqualToString:name]) {
        return BRLMPrintSettingsVerticalAlignmentTop;
    }
    else if([@"MIDDLE" isEqualToString:name]) {
        return BRLMPrintSettingsVerticalAlignmentCenter;
    }
    else if([@"BOTTOM" isEqualToString:name]) {
        return BRLMPrintSettingsVerticalAlignmentBottom;
    }
    
    return BRLMPrintSettingsVerticalAlignmentTop;
    
}

+ (BRLMPrintSettingsOrientation)orientationFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString *) [map objectForKey:@"name"];
    
    if ([@"PORTRAIT" isEqualToString:name]) {
        return BRLMPrintSettingsOrientationPortrait;
    }
    else if ([@"LANDSCAPE" isEqualToString:name]) {
        return BRLMPrintSettingsOrientationLandscape;
    }
    
    return BRLMPrintSettingsOrientationPortrait;
}


+ (BRLMPrintSettingsResolution)printResolutionFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString *)[map objectForKey:@"name"];
    
    if ([@"LOW_RESOLUTION" isEqualToString:name]) {
        return BRLMPrintSettingsResolutionLow;
    }
    else if ([@"NORMAL" isEqualToString:name]) {
        return BRLMPrintSettingsResolutionNormal;
    }
    else if ([@"DOUBLE_SPEED" isEqualToString:name]) {
        return BRLMPrintSettingsResolutionLow;
    }
    else if ([@"HIGH_RESOLUTION" isEqualToString:name]) {
        return BRLMPrintSettingsResolutionHigh;
    }
    
    return BRLMPrintSettingsResolutionNormal;
}

+ (BRLMPrintSettingsPrintQuality)printQualityFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    NSString * name = (NSString *)[map objectForKey:@"name"];
    
    if ([@"LOW_RESOLUTION" isEqualToString:name]) {
        return BRLMPrintSettingsPrintQualityFast;
    }
    else if ([@"NORMAL" isEqualToString:name]) {
        return BRLMPrintSettingsPrintQualityBest;
    }
    else if ([@"DOUBLE_SPEED" isEqualToString:name]) {
        return BRLMPrintSettingsPrintQualityFast;
    }
    else if ([@"HIGH_RESOLUTION" isEqualToString:name]) {
        return BRLMPrintSettingsPrintQualityBest;
    }
    
    return BRLMPrintSettingsPrintQualityBest;
    
}

+ (BRLMPrintSettingsScaleMode)printModeFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString *)[map objectForKey:@"name"];
    
    if([@"ORIGINAL" isEqualToString:name]) {
        return BRLMPrintSettingsScaleModeActualSize;
    }
    else if([@"FIT_TO_PAGE" isEqualToString:name]) {
        return BRLMPrintSettingsScaleModeFitPageAspect;
    }
    else if([@"SCALE" isEqualToString:name]) {
        return BRLMPrintSettingsScaleModeScaleValue;
    }
    else if([@"FIT_TO_PAPER" isEqualToString:name]) {
        return BRLMPrintSettingsScaleModeFitPaperAspect;
    }
    
    return BRLMPrintSettingsScaleModeActualSize;
}

+ (BRLMCustomPaperSizePaperKind)paperKindFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString *) [map objectForKey:@"name"];
    
    if ([@"ROLL" isEqualToString:name]) {
        return BRLMCustomPaperSizePaperKindRoll;
    }
    else if ([@"DIE_CUT" isEqualToString:name]) {
        return BRLMCustomPaperSizePaperKindDieCut;
    }
    else if ([@"MARKED_ROLL" isEqualToString:name]) {
        return BRLMCustomPaperSizePaperKindMarkRoll;
    }
    
    return BRLMCustomPaperSizePaperKindRoll;
}

+ (BRLMCustomPaperSizeLengthUnit)unitFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString*) [map objectForKey:@"name"];
    
    if ([@"Inch" isEqualToString: name]) {
        return BRLMCustomPaperSizeLengthUnitInch;
    }
    else if ([@"Mm" isEqualToString: name]) {
        return BRLMCustomPaperSizeLengthUnitMm;
    }
    
    return BRLMCustomPaperSizeLengthUnitInch;
}

+ (BRLMCustomPaperSizeMargins)customMarginFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    CGFloat topMargin = [(NSNumber *)[map objectForKey:@"topMargin"] doubleValue];
    CGFloat bottomMargin = [(NSNumber *)[map objectForKey:@"bottomMargin"] doubleValue];
    CGFloat leftMargin = [(NSNumber *)[map objectForKey:@"leftMargin"] doubleValue];
    CGFloat rightMargin = [(NSNumber *)[map objectForKey:@"rightMargin"] doubleValue];
    
    return BRLMCustomPaperSizeMarginsMake(
                                        topMargin,
                                          leftMargin,
                                          bottomMargin,
                                          rightMargin);
}

+ (BRLMCustomPaperSize *)customPaperInfoFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map binCustomPaperMap:(NSDictionary<NSString *, NSObject *> *)binCustomPaperMap{
    
    if (![binCustomPaperMap isEqual:[NSNull null]]) {
        // TODO Get Asset key
        NSString * assetFile = (NSString *)[binCustomPaperMap objectForKey:@"assetPath"];
        NSString* key = [[BrotherUtils registrarFlutter] lookupKeyForAsset:assetFile];
        NSString* path = [[NSBundle mainBundle] pathForResource:key ofType:nil];
        
        NSURL * customPaperFileUrl = [NSURL fileURLWithPath:path];
        
        BRLMCustomPaperSize *customPaperSize = [[BRLMCustomPaperSize alloc] initWithFile:customPaperFileUrl];
        return customPaperSize;
            
    }
    
    if ([map isEqual:[NSNull null]] ) {
        // No bin file or custom paper was passed.
        return NULL;
    }
    
    NSDictionary<NSString*, NSObject *> * dartPaperKind = (NSDictionary<NSString*, NSObject *> *)[map objectForKey:@"paperKind"];
    
    BRLMCustomPaperSizePaperKind paperKind = [BrotherUtils paperKindFromMapWithValue:dartPaperKind];
    
    NSDictionary<NSString*, NSObject *> * dartUnit = (NSDictionary<NSString*, NSObject *> *)[map objectForKey:@"unit"];
    
    BRLMCustomPaperSizeLengthUnit unit = [BrotherUtils unitFromMapWithValue: dartUnit];
    
    BRLMCustomPaperSizeMargins margins = [BrotherUtils customMarginFromMapWithValue:map];
    
    float tapeWidth = [(NSNumber *)[map objectForKey:@"tapeWidth"] doubleValue];
    float tapeLength = [(NSNumber *)[map objectForKey:@"tapeLength"] doubleValue];
    float markHeight = [(NSNumber *)[map objectForKey:@"markHeight"] doubleValue];
    float gapLength = [(NSNumber *)[map objectForKey:@"labelPitch"] doubleValue];
    float markPosition = [(NSNumber *)[map objectForKey:@"markPosition"] doubleValue];
    
    
    if (paperKind == BRLMCustomPaperSizePaperKindDieCut) {
        return [[BRLMCustomPaperSize alloc] initDieCutWithTapeWidth:tapeWidth tapeLength:tapeLength margins:margins gapLength:gapLength unitOfLength:unit];
    }
    else if (paperKind == BRLMCustomPaperSizePaperKindByFile) {
        // Note: This is handled with the asset files as the start of the method.
        //[[BRLMCustomPaperSize alloc] initWithFile:<#(nonnull NSURL *)#>]
        
    }
    else if (paperKind == BRLMCustomPaperSizePaperKindMarkRoll) {
        return [[BRLMCustomPaperSize alloc] initMarkRollWithTapeWidth:tapeWidth tapeLength:tapeLength margins:margins markPosition:markPosition markHeight:markHeight unitOfLength:unit];
    }
    else if (paperKind == BRLMCustomPaperSizePaperKindRoll) {
        return [[BRLMCustomPaperSize alloc] initRollWithTapeWidth:tapeWidth margins:margins unitOfLength:unit];
    }
    
    return [[BRLMCustomPaperSize alloc] initRollWithTapeWidth:tapeWidth margins:margins unitOfLength:unit];
}

+ (BRLMPrinterModel) printerModelFromPrinterInfoMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSDictionary<NSString *,NSObject *> * dartPrinterModel = (NSDictionary<NSString *,NSObject *> *) [map objectForKey:@"printerModel"];
    
    return [BrotherUtils modelFromMapWithValue:dartPrinterModel];
}

+ (LabelName *)labelNameFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    NSString * name = (NSString *)[map objectForKey:@"name"];
    NSString * model = (NSString *)[map objectForKey:@"model"];
    return [[LabelName alloc] initWithName:name model:model];
}

+ (BRLMChannel *)printChannelWithPrintSettingsMap:(NSDictionary<NSString *,NSObject *> *) map {
    // TODO Get port dart info
    NSDictionary<NSString *, NSObject*> * dartPort = (NSDictionary<NSString *, NSObject*> *)[map objectForKey:@"port"];
    // TODO Get Channel type
    BRLMChannelType channelType = [BrotherUtils portFromMapWithValue:dartPort];
    // TODO From channel type create channel.
    BRLMChannel * outChannel;
    
    NSString * ipAddress = (NSString *) [map objectForKey:@"ipAddress"];
    NSString * macAddress = (NSString *) [map objectForKey:@"macAddress"];
    NSString * localName = (NSString *) [map objectForKey:@"localName"];
    
    if (channelType == BRLMChannelTypeWiFi) {
        outChannel = [[BRLMChannel alloc] initWithWifiIPAddress:ipAddress];
    }
    else if (channelType == BRLMChannelTypeBluetoothMFi) {
        outChannel = [[BRLMChannel alloc] initWithBluetoothSerialNumber:macAddress];
        
    }
    else if (channelType == BRLMChannelTypeBluetoothLowEnergy) {
        outChannel = [[BRLMChannel alloc] initWithBLELocalName:localName];
    }
    else {
        outChannel = [[BRLMChannel alloc] initWithWifiIPAddress:ipAddress];
    }
    
    return outChannel;
}

+ (BRLMQLPrintSettingsLabelSize)qlLabelSizeWithName:(LabelName *)labelName {

    if ([@"W17H54" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW17H54;
    }
    else if ([@"W17H87" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW17H87;
    }
    else if ([@"W23H23" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW23H23;
    }
    else if ([@"W29H42" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW29H42;
    }
    else if ([@"W29H90" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW29H90;
    }
    else if ([@"W38H90" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW38H90;
    }
    else if ([@"W39H48" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW39H48;
    }
    else if ([@"W52H29" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW52H29;
    }
    else if ([@"W54H29" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW54H29;
    }
    else if ([@"W62H29" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW62H29;
    }
    else if ([@"W62H100" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW62H100;
    }
    else if ([@"W12" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeRollW12;
    }
    else if ([@"W29" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeRollW29;
    }
    else if ([@"W38" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeRollW38;
    }
    else if ([@"W50" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeRollW50;
    }
    else if ([@"W54" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeRollW54;
    }
    else if ([@"W62" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeRollW62;
    }
    else if ([@"W62RB" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeRollW62RB;
    }
    else if ([@"W60H86" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW60H86;
    }
    else if ([@"W102" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeRollW102;
    }
    else if ([@"W102H51" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDTRollW102H51;
    }
    else if ([@"W102H152" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDTRollW102H152;
    }
    else if ([@"W103" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeRollW103;
    }
    else if ([@"W103H164" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDieCutW103H164;
    }
    else if ([@"DT_W90" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDTRollW90;
    }
    else if ([@"DT_W102" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDTRollW102;
    }
    else if ([@"DT_W102H51" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDTRollW102H51;
    }
    else if ([@"DT_W102H152" isEqualToString:[labelName name]]) {
        return BRLMQLPrintSettingsLabelSizeDTRollW102H152;
    }

    return BRLMQLPrintSettingsLabelSizeDieCutW103H164;
}

+ (BRLMPTPrintSettingsLabelSize)ptLabelSizeWithName:(LabelName *)labelName {
    
    if ([@"W3_5" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidth3_5mm;
    }
    else if ([@"W6" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidth6mm;
    }
    else if ([@"W9" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidth9mm;
    }
    else if ([@"W12" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidth12mm;
    }
    else if ([@"W18" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidth18mm;
    }
    else if ([@"W24" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidth24mm;
    }
    else if ([@"W36" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidth36mm;
    }
    else if ([@"HS_W6" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidthHS_5_8mm;
    }
    else if ([@"HS_W9" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidthHS_8_8mm;
    }
    else if ([@"HS_W12" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidthHS_11_7mm;
    }
    else if ([@"HS_W18" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidthHS_17_7mm;
    }
    else if ([@"HS_W24" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidthHS_23_6mm;
    }
    else if ([@"FLE_W21H45" isEqualToString:[labelName name]]) {
        return BRLMPTPrintSettingsLabelSizeWidthFL_21x45mm;
    }
    
    /*
      Note: These were not found in the iOS side.
         R6_5,
         R6_0,
         R5_0,
         R4_0,
         R3_5,
         R3_0,
         R2_5,
         UNSUPPORT
     */
    
    return BRLMPTPrintSettingsLabelSizeWidth3_5mm;
}

+ (BRLMQLPrintSettings *) qlPrintSettingsFromMapWithValue:(NSDictionary<NSString *, NSObject *> *) map {
    
    BRLMPrinterModel printerModel = [BrotherUtils printerModelFromPrinterInfoMapWithValue:map];
    
    NSDictionary<NSString*, NSObject*> * dartLabelName = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"labelName"];
    LabelName * labelName = [BrotherUtils labelNameFromMapWithValue:dartLabelName];
    
    BRLMQLPrintSettings * printerSettings = [[BRLMQLPrintSettings alloc] initDefaultPrintSettingsWithPrinterModel:printerModel];
    
    NSDictionary<NSString*, NSObject*> * dartPrintQuality = (NSDictionary<NSString*, NSObject*> *) [map objectForKey:@"printQuality"];
    
    printerSettings.labelSize = [BrotherUtils qlLabelSizeWithName:labelName];
    printerSettings.autoCut = [[map objectForKey:@"isAutoCut"] isEqual:@(YES)];
    printerSettings.cutAtEnd = [[map objectForKey:@"isEndCut"] isEqual:@(YES)];
    printerSettings.resolution = [BrotherUtils printResolutionFromMapWithValue:dartPrintQuality];
    printerSettings.autoCutForEachPageCount = (NSUInteger)[(NSNumber *)[map objectForKey:@"autoCutForEachPageCount"] integerValue];
    // TODO Extract info from map.
    //[x]labelSize
    //autoCutForEachPageCount
    //[x]autoCut
    //[x]cutAtEnd
    //[x]resolution
    
    
    NSDictionary<NSString*, NSObject*> * dartPrintMode = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"printMode"];
    
    printerSettings.scaleMode = [BrotherUtils printModeFromMapWithValue:dartPrintMode];
    
    printerSettings.scaleValue = [(NSNumber *)[map objectForKey:@"scaleValue"] doubleValue];
    
    NSDictionary<NSString*, NSObject*> * dartOrientation = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"orientation"];
    
    printerSettings.printOrientation = [BrotherUtils orientationFromMapWithValue:dartOrientation];
    
    NSDictionary<NSString*, NSObject*> * dartHalftone = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"halftone"];
    
    printerSettings.halftone = [BrotherUtils halftoneFromMapWithValue:dartHalftone];

    NSDictionary<NSString*, NSObject*> * dartAlign = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"align"];

    printerSettings.hAlignment = [BrotherUtils alignFromMapWithValue:dartAlign];
    
    NSDictionary<NSString*, NSObject*> * dartValign = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"valign"];
    
    printerSettings.vAlignment = [BrotherUtils vAlignFromMapWithValue:dartValign];

    
    if ([[map objectForKey:@"mode9"] isEqual:@(YES)]) {
        printerSettings.compress = BRLMPrintSettingsCompressModeMode9;
    }
    else {
        printerSettings.compress = BRLMPrintSettingsCompressModeNone;
    }
    
    printerSettings.halftoneThreshold = [(NSNumber *)[map objectForKey:@"thresholdingValue"] intValue];
    
    
    printerSettings.numCopies = (NSUInteger)[(NSNumber *)[map objectForKey:@"numberOfCopies"] integerValue];
    
    printerSettings.skipStatusCheck = [[map objectForKey:@"skipStatusCheck"] isEqual:@(YES)];
    
    NSDictionary<NSString*, NSObject*> * dartPrintQuality2 = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"printQuality"];
    
    printerSettings.printQuality = [BrotherUtils printQualityFromMapWithValue:dartPrintQuality2];
    
    // TODO Add extra configuration
    //[x]scaleMode @"printMode"(map)
    //[x]scaleValue @"scaleValue" (double)
    //[x]printOrientation @"orientation" (map)
    //[x]halftone @"halftone" (map)
    //[x]hAlignment @"align" (map)
    //[x]vAlignment @"valign" (map)
    //[x]compress ???
    //[x]halftoneThreshold @"thresholdingValue" (int)
    //[x]numCopies @"numberOfCopies" (int)
    //[x]skipStatusCheck @"skipStatusCheck" (@YES/@NO type)
    //printQuality @"printQuality" (map)
    
    return printerSettings;
}

+ (BRLMRJPrintSettingsDensity)rjPrintDensityWithValue:(NSNumber *)density {
    if ([density isEqualToNumber:@0]) {
        return BRLMRJPrintSettingsDensityWeakLevel5;
    }
    else if ([density isEqualToNumber:@1]) {
        return BRLMRJPrintSettingsDensityWeakLevel4;
    }
    else if ([density isEqualToNumber:@2]) {
        return BRLMRJPrintSettingsDensityWeakLevel3;
    }
    else if ([density isEqualToNumber:@3]) {
        return BRLMRJPrintSettingsDensityWeakLevel2;
    }
    else if ([density isEqualToNumber:@4]) {
        return BRLMRJPrintSettingsDensityWeakLevel1;
    }
    else if ([density isEqualToNumber:@5]) {
        return BRLMRJPrintSettingsDensityNeutral;
    }
    else if ([density isEqualToNumber:@6]) {
        return BRLMRJPrintSettingsDensityStrongLevel1;
    }
    else if ([density isEqualToNumber:@7]) {
        return BRLMRJPrintSettingsDensityStrongLevel2;
    }
    else if ([density isEqualToNumber:@8]) {
        return BRLMRJPrintSettingsDensityStrongLevel3;
    }
    else if ([density isEqualToNumber:@9]) {
        return BRLMRJPrintSettingsDensityStrongLevel4;
    }
    else if ([density isEqualToNumber:@10]) {
        return BRLMRJPrintSettingsDensityStrongLevel5;
    }
    
    return BRLMRJPrintSettingsDensityNeutral;
}

+ (BRLMRJPrintSettings *)rjPrintSettingsFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    BRLMPrinterModel printerModel = [BrotherUtils printerModelFromPrinterInfoMapWithValue:map];
    
     
    NSDictionary<NSString*, NSObject*> * dartBinCustomPaperMap = (NSDictionary<NSString*, NSObject*> *) [map objectForKey:@"binCustomPaper"];
    
    NSDictionary<NSString*, NSObject*> * dartCustomPaperInfo = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"customPaperInfo"];
    
    BRLMCustomPaperSize * customPaperSize = [BrotherUtils customPaperInfoFromMapWithValue:dartCustomPaperInfo binCustomPaperMap:dartBinCustomPaperMap];
    
    BRLMRJPrintSettings * printerSettings = [[BRLMRJPrintSettings alloc] initDefaultPrintSettingsWithPrinterModel:printerModel];
    
    NSNumber * density = (NSNumber *)[map objectForKey:@"rjDensity"];
    
    printerSettings.density = [BrotherUtils rjPrintDensityWithValue:density];
    printerSettings.rotate180degrees = [[map objectForKey:@"rotate180"] isEqual:@(YES)];
    printerSettings.peelLabel = [[map objectForKey:@"peelMode"]isEqual:@(YES)];
    printerSettings.customPaperSize = customPaperSize;
    
    
    //customPaperSize "customPaperInfo" TODO
    
    NSDictionary<NSString*, NSObject*> * dartPrintMode = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"printMode"];
    
    printerSettings.scaleMode = [BrotherUtils printModeFromMapWithValue:dartPrintMode];
    
    printerSettings.scaleValue = [(NSNumber *)[map objectForKey:@"scaleValue"] doubleValue];
    
    NSDictionary<NSString*, NSObject*> * dartOrientation = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"orientation"];
    
    printerSettings.printOrientation = [BrotherUtils orientationFromMapWithValue:dartOrientation];
    
    NSDictionary<NSString*, NSObject*> * dartHalftone = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"halftone"];
    
    printerSettings.halftone = [BrotherUtils halftoneFromMapWithValue:dartHalftone];

    NSDictionary<NSString*, NSObject*> * dartAlign = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"align"];

    printerSettings.hAlignment = [BrotherUtils alignFromMapWithValue:dartAlign];
    
    NSDictionary<NSString*, NSObject*> * dartValign = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"valign"];
    
    printerSettings.vAlignment = [BrotherUtils vAlignFromMapWithValue:dartValign];

    
    if ([[map objectForKey:@"mode9"] isEqual:@(YES)]) {
        printerSettings.compress = BRLMPrintSettingsCompressModeMode9;
    }
    else {
        printerSettings.compress = BRLMPrintSettingsCompressModeNone;
    }
    
    printerSettings.halftoneThreshold = [(NSNumber *)[map objectForKey:@"thresholdingValue"] intValue];
    
    printerSettings.numCopies = (NSUInteger)[(NSNumber *)[map objectForKey:@"numberOfCopies"] integerValue];
    
    printerSettings.skipStatusCheck = [[map objectForKey:@"skipStatusCheck"] isEqual:@(YES)];
    
    NSDictionary<NSString*, NSObject*> * dartPrintQuality2 = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"printQuality"];
    
    printerSettings.printQuality = [BrotherUtils printQualityFromMapWithValue:dartPrintQuality2];
    
    // TODO Add extra configuration
    //[x]scaleMode @"printMode"(map)
    //[x]scaleValue @"scaleValue" (double)
    //[x]printOrientation @"orientation" (map)
    //[x]halftone @"halftone" (map)
    //[x]hAlignment @"align" (map)
    //[x]vAlignment @"valign" (map)
    //[x]compress ???
    //[x]halftoneThreshold @"thresholdingValue" (int)
    //[x]numCopies @"numberOfCopies" (int)
    //[x]skipStatusCheck @"skipStatusCheck" (@YES/@NO type)
    //printQuality @"printQuality" (map)
    
    return printerSettings;
}

+ (BRLMPJPrintSettingsDensity)pjPrintDensityWithValue:(NSNumber *)density {
    if ([density isEqualToNumber:@0]) {
        return BRLMPJPrintSettingsDensityWeakLevel5;
    }
    else if ([density isEqualToNumber:@1]) {
        return BRLMPJPrintSettingsDensityWeakLevel4;
    }
    else if ([density isEqualToNumber:@2]) {
        return BRLMPJPrintSettingsDensityWeakLevel3;
    }
    else if ([density isEqualToNumber:@3]) {
        return BRLMPJPrintSettingsDensityWeakLevel2;
    }
    else if ([density isEqualToNumber:@4]) {
        return BRLMPJPrintSettingsDensityWeakLevel1;
    }
    else if ([density isEqualToNumber:@5]) {
        return BRLMPJPrintSettingsDensityNeutral;
    }
    else if ([density isEqualToNumber:@6]) {
        return BRLMPJPrintSettingsDensityStrongLevel1;
    }
    else if ([density isEqualToNumber:@7]) {
        return BRLMPJPrintSettingsDensityStrongLevel2;
    }
    else if ([density isEqualToNumber:@8]) {
        return BRLMPJPrintSettingsDensityStrongLevel3;
    }
    else if ([density isEqualToNumber:@9]) {
        return BRLMPJPrintSettingsDensityStrongLevel4;
    }
    else if ([density isEqualToNumber:@10]) {
        return BRLMPJPrintSettingsDensityStrongLevel5;
    }
    
    return BRLMPJPrintSettingsDensityNeutral;
}


+ (BRLMPJPrintSettingsPaperSizeStandard) pjPaperSizeStandardFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString *)[map objectForKey:@"name"];
    
    if ([@"CUSTOM" isEqualToString:name]) {
        return BRLMPJPrintSettingsPaperSizeStandardCustom;
    }
    else if  ([@"A7" isEqualToString:name]) {
        return BRLMPJPrintSettingsPaperSizeStandardA5;
    }
    else if  ([@"A6" isEqualToString:name]) {
        return BRLMPJPrintSettingsPaperSizeStandardA5;
    }
    else if  ([@"A5" isEqualToString:name]) {
        return BRLMPJPrintSettingsPaperSizeStandardA5;
    }
    else if  ([@"A4" isEqualToString:name]) {
        return BRLMPJPrintSettingsPaperSizeStandardA4;
    }
    else if  ([@"LEGAL" isEqualToString:name]) {
        return BRLMPJPrintSettingsPaperSizeStandardLegal;
    }
    else if  ([@"LETTER" isEqualToString:name]) {
        return BRLMPJPrintSettingsPaperSizeStandardLetter;
    }
    
    else return BRLMPJPrintSettingsPaperSizeStandardA4;
}

+ (BRLMPJPrintSettingsPaperSize *)pjPrinterPaperSizeFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSDictionary<NSString *, NSObject*> * dartStandardSize = (NSDictionary<NSString *, NSObject *>*) [map objectForKey:@"paperSize"];
    
    //paperSizeStandard
    BRLMPJPrintSettingsPaperSizeStandard standardPaperSize = [BrotherUtils pjPaperSizeStandardFromMapWithValue:dartStandardSize];
    
    //customPaper
    // TODO Support Custom size, need to send paper in.
    
    return [[BRLMPJPrintSettingsPaperSize alloc] initWithPaperSizeStandard:standardPaperSize];
    
}

+ (BRLMPJPrintSettingsPaperType)pjPaperKindFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString *)[map objectForKey:@"name"];
    
    if ([@"PJ_ROLL" isEqualToString:name]) {
        return BRLMPJPrintSettingsPaperTypeRoll;
    }
    else if ([@"PJ_CUT_PAPER" isEqualToString:name]) {
        return BRLMPJPrintSettingsPaperTypeCutSheet;
    }
    
    return BRLMPJPrintSettingsPaperTypeCutSheet;

}

+ (BRLMPJPrintSettingsRollCase)pjRollCaseFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString *)[map objectForKey:@"name"];
    
    if ([@"PJ_ROLLCASE_OFF" isEqualToString:name]) {
        return BRLMPJPrintSettingsRollCaseNone;
    }
    else if ([@"PJ_ROLLCASE_ON" isEqualToString:name]) {
        return BRLMPJPrintSettingsRollCasePARC001;
    }
    else if ([@"PJ_ROLLCASE_WITH_ANTICURL" isEqualToString:name]) {
        return BRLMPJPrintSettingsRollCasePARC001_NoAntiCurl;
    }
    
    return BRLMPJPrintSettingsRollCaseNone;
    
}

+ (BRLMPJPrintSettingsFeedMode)pjFeedModeFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString *)[map objectForKey:@"name"];
    
    if ([@"PJ_FEED_MODE_FREE" isEqualToString:name]) {
        return BRLMPJPrintSettingsFeedModeNoFeed;
    }
    else if ([@"PJ_FEED_MODE_FIXEDPAGE" isEqualToString:name]) {
        return BRLMPJPrintSettingsFeedModeFixedPage;
    }
    else if ([@"PJ_FEED_MODE_ENDOFPAGE" isEqualToString:name]) {
        return BRLMPJPrintSettingsFeedModeEndOfPage;
    }
    else if ([@"PJ_FEED_MODE_ENDOFPAGERETRACT" isEqualToString:name]) {
        return BRLMPJPrintSettingsFeedModeEndOfPageRetract;
    }
    
    return BRLMPJPrintSettingsFeedModeFixedPage;
}

+ (BRLMPJPrintSettingsPrintSpeed)pjPrintSpeedWithValue:(NSNumber *)pjSpeed {
    
    if ([pjSpeed isEqualToNumber: @0]) {
        return BRLMPJPrintSettingsPrintSpeed2_5inchPerSec;
    }
    else if([pjSpeed isEqualToNumber:@1]) {
        return BRLMPJPrintSettingsPrintSpeed1_9inchPerSec;
    }
    else if ([pjSpeed isEqualToNumber:@2]) {
        return BRLMPJPrintSettingsPrintSpeed1_6inchPerSec;
    }
    else if ([pjSpeed isEqualToNumber:@3]) {
        return BRLMPJPrintSettingsPrintSpeed1_1inchPerSec;
    }
    
    return BRLMPJPrintSettingsPrintSpeed1_6inchPerSec;
}

+ (BRLMPJPrintSettingsPaperInsertionPosition) pjPaperPositionFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString *)[map objectForKey:@"name"];
    
    if ([@"LEFT" isEqualToString:name]) {
        return BRLMPJPrintSettingsPaperInsertionPositionLeft;
    }
    else if ([@"CENTER" isEqualToString:name]) {
        return BRLMPJPrintSettingsPaperInsertionPositionCenter;
    }
    else if ([@"RIGHT" isEqualToString:name]) {
        return BRLMPJPrintSettingsPaperInsertionPositionRight;
    }
    
    return BRLMPJPrintSettingsPaperInsertionPositionLeft;
}

+ (BRLMPJPrintSettings *)pjPrintSettingsFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    
    BRLMPrinterModel printerModel = [BrotherUtils printerModelFromPrinterInfoMapWithValue:map];
    
    BRLMPJPrintSettings * printerSettings = [[BRLMPJPrintSettings alloc] initDefaultPrintSettingsWithPrinterModel:printerModel];
    
    
    NSDictionary<NSString *, NSObject *> * dartPaperKind = (NSDictionary<NSString *, NSObject *> *)[map objectForKey:@"pjPaperKind"];
    
    NSDictionary<NSString *, NSObject *> * dartPjFeedMode = (NSDictionary<NSString *, NSObject *> *)[map objectForKey:@"pjFeedMode"];
    
    NSNumber * dartPjDensity = (NSNumber *) [map objectForKey:@"pjDensity"];
    
    NSDictionary<NSString *, NSObject *> * dartPjRollCase = (NSDictionary<NSString *, NSObject *> *)[map objectForKey:@"rollPrinterCase"];
    
    NSDictionary<NSString *, NSObject *> * dartPaperPosition = (NSDictionary<NSString *, NSObject *> *)[map objectForKey:@"paperPosition"];
    
    NSNumber * dartPjSpeed = (NSNumber *) [map objectForKey:@"pjSpeed"];
    
    bool dashLine = [[map objectForKey:@"dashLine"] isEqual:@(YES)];
    
    printerSettings.paperSize = [BrotherUtils pjPrinterPaperSizeFromMapWithValue:map];
    
    
    printerSettings.paperType = [BrotherUtils pjPaperKindFromMapWithValue:dartPaperKind];
    
    printerSettings.paperInsertionPosition = [BrotherUtils pjPaperPositionFromMapWithValue:dartPaperPosition];
    
    printerSettings.feedMode = [BrotherUtils pjFeedModeFromMapWithValue:dartPjFeedMode];
    
    printerSettings.density = [BrotherUtils pjPrintDensityWithValue:dartPjDensity];
    
    printerSettings.rollCase = [BrotherUtils pjRollCaseFromMapWithValue:dartPjRollCase];
    
    printerSettings.printSpeed = [BrotherUtils pjPrintSpeedWithValue:dartPjSpeed];
    
    
    printerSettings.usingCarbonCopyPaper = [[map objectForKey:@"pjCarbon"] isEqual:@(YES)];
    
    printerSettings.printDashLine = dashLine;
    
    NSDictionary<NSString*, NSObject*> * dartPrintMode = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"printMode"];
    
    printerSettings.scaleMode = [BrotherUtils printModeFromMapWithValue:dartPrintMode];
    
    printerSettings.scaleValue = [(NSNumber *)[map objectForKey:@"scaleValue"] doubleValue];
    
    NSDictionary<NSString*, NSObject*> * dartOrientation = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"orientation"];
    
    printerSettings.printOrientation = [BrotherUtils orientationFromMapWithValue:dartOrientation];
    
    NSDictionary<NSString*, NSObject*> * dartHalftone = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"halftone"];
    
    printerSettings.halftone = [BrotherUtils halftoneFromMapWithValue:dartHalftone];

    NSDictionary<NSString*, NSObject*> * dartAlign = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"align"];

    printerSettings.hAlignment = [BrotherUtils alignFromMapWithValue:dartAlign];
    
    NSDictionary<NSString*, NSObject*> * dartValign = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"valign"];
    
    printerSettings.vAlignment = [BrotherUtils vAlignFromMapWithValue:dartValign];

    
    if ([[map objectForKey:@"mode9"] isEqual:@(YES)]) {
        printerSettings.compress = BRLMPrintSettingsCompressModeMode9;
    }
    else {
        printerSettings.compress = BRLMPrintSettingsCompressModeNone;
    }
    
    printerSettings.halftoneThreshold = [(NSNumber *)[map objectForKey:@"thresholdingValue"] intValue];
    
    printerSettings.numCopies = (NSUInteger)[(NSNumber *)[map objectForKey:@"numberOfCopies"] integerValue];
    
    printerSettings.skipStatusCheck = [[map objectForKey:@"skipStatusCheck"] isEqual:@(YES)];
    
    NSDictionary<NSString*, NSObject*> * dartPrintQuality2 = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"printQuality"];
    
    printerSettings.printQuality = [BrotherUtils printQualityFromMapWithValue:dartPrintQuality2];
    
    // TODO Add extra configuration
    //[x]scaleMode @"printMode"(map)
    //[x]scaleValue @"scaleValue" (double)
    //[x]printOrientation @"orientation" (map)
    //[x]halftone @"halftone" (map)
    //[x]hAlignment @"align" (map)
    //[x]vAlignment @"valign" (map)
    //[x]compress ???
    //[x]halftoneThreshold @"thresholdingValue" (int)
    //[x]numCopies @"numberOfCopies" (int)
    //[x]skipStatusCheck @"skipStatusCheck" (@YES/@NO type)
    //printQuality @"printQuality" (map)
    
    return printerSettings;
}


+ (BRLMTDPrintSettingsDensity)tdPrintDensityWithValue:(NSNumber *)density {
    
    if ([density isEqualToNumber:@0]) {
        return BRLMTDPrintSettingsDensityWeakLevel5;
    }
    else if ([density isEqualToNumber:@1]) {
        return BRLMTDPrintSettingsDensityWeakLevel4;
    }
    else if ([density isEqualToNumber:@2]) {
        return BRLMTDPrintSettingsDensityWeakLevel3;
    }
    else if ([density isEqualToNumber:@3]) {
        return BRLMTDPrintSettingsDensityWeakLevel2;
    }
    else if ([density isEqualToNumber:@4]) {
        return BRLMTDPrintSettingsDensityWeakLevel1;
    }
    else if ([density isEqualToNumber:@5]) {
        return BRLMTDPrintSettingsDensityNeutral;
    }
    else if ([density isEqualToNumber:@6]) {
        return BRLMTDPrintSettingsDensityStrongLevel1;
    }
    else if ([density isEqualToNumber:@7]) {
        return BRLMTDPrintSettingsDensityStrongLevel2;
    }
    else if ([density isEqualToNumber:@8]) {
        return BRLMTDPrintSettingsDensityStrongLevel3;
    }
    else if ([density isEqualToNumber:@9]) {
        return BRLMTDPrintSettingsDensityStrongLevel4;
    }
    else if ([density isEqualToNumber:@10]) {
        return BRLMTDPrintSettingsDensityStrongLevel5;
    }
    
    return BRLMTDPrintSettingsDensityNeutral;
}

+ (BRLMTDPrintSettings *)tdPrintSettingsFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    //NSDictionary<NSString*, NSObject*> * dartPrintModel = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"printerModel"];
    
    BRLMPrinterModel printerModel = [BrotherUtils printerModelFromPrinterInfoMapWithValue:map];
    
    NSDictionary<NSString *, NSObject *> * dartCustomPaperInfo = (NSDictionary<NSString *, NSObject *> *) [map objectForKey:@"customPaperInfo"];
    
    NSNumber * dartRjDensity = (NSNumber *) [map objectForKey:@"rjDensity"];
    
    bool peelLabel = [[map objectForKey:@"peelMode"]isEqual:@(YES)];
    
    BRLMTDPrintSettings * printerSettings = [[BRLMTDPrintSettings alloc] initDefaultPrintSettingsWithPrinterModel:printerModel];
    
    NSDictionary<NSString*, NSObject*> * dartBinCustomPaperMap = (NSDictionary<NSString*, NSObject*> *) [map objectForKey:@"binCustomPaper"];
    
    printerSettings.customPaperSize = [BrotherUtils customPaperInfoFromMapWithValue:dartCustomPaperInfo binCustomPaperMap:dartBinCustomPaperMap];
    
    printerSettings.density = [BrotherUtils tdPrintDensityWithValue:dartRjDensity];
    printerSettings.peelLabel = peelLabel;
    
    NSDictionary<NSString*, NSObject*> * dartPrintMode = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"printMode"];
    
    printerSettings.scaleMode = [BrotherUtils printModeFromMapWithValue:dartPrintMode];
    
    printerSettings.scaleValue = [(NSNumber *)[map objectForKey:@"scaleValue"] doubleValue];
    
    NSDictionary<NSString*, NSObject*> * dartOrientation = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"orientation"];
    
    printerSettings.printOrientation = [BrotherUtils orientationFromMapWithValue:dartOrientation];
    
    NSDictionary<NSString*, NSObject*> * dartHalftone = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"halftone"];
    
    printerSettings.halftone = [BrotherUtils halftoneFromMapWithValue:dartHalftone];

    NSDictionary<NSString*, NSObject*> * dartAlign = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"align"];

    printerSettings.hAlignment = [BrotherUtils alignFromMapWithValue:dartAlign];
    
    NSDictionary<NSString*, NSObject*> * dartValign = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"valign"];
    
    printerSettings.vAlignment = [BrotherUtils vAlignFromMapWithValue:dartValign];

    
    if ([[map objectForKey:@"mode9"] isEqual:@(YES)]) {
        printerSettings.compress = BRLMPrintSettingsCompressModeMode9;
    }
    else {
        printerSettings.compress = BRLMPrintSettingsCompressModeNone;
    }
    
    printerSettings.halftoneThreshold = [(NSNumber *)[map objectForKey:@"thresholdingValue"] intValue];
    
    printerSettings.numCopies = (NSUInteger)[(NSNumber *)[map objectForKey:@"numberOfCopies"] integerValue];
    
    printerSettings.skipStatusCheck = [[map objectForKey:@"skipStatusCheck"] isEqual:@(YES)];
    
    NSDictionary<NSString*, NSObject*> * dartPrintQuality2 = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"printQuality"];
    
    printerSettings.printQuality = [BrotherUtils printQualityFromMapWithValue:dartPrintQuality2];
    
    printerSettings.autoCut = [[map objectForKey:@"isAutoCut"] isEqual:@(YES)];
    
    printerSettings.autoCutForEachPageCount = (NSUInteger)[(NSNumber *)[map objectForKey:@"autoCutForEachPageCount"] integerValue];
        
    // TODO Add extra configuration
    //[x]scaleMode @"printMode"(map)
    //[x]scaleValue @"scaleValue" (double)
    //[x]printOrientation @"orientation" (map)
    //[x]halftone @"halftone" (map)
    //[x]hAlignment @"align" (map)
    //[x]vAlignment @"valign" (map)
    //[x]compress ???
    //[x]halftoneThreshold @"thresholdingValue" (int)
    //[x]numCopies @"numberOfCopies" (int)
    //[x]skipStatusCheck @"skipStatusCheck" (@YES/@NO type)
    //printQuality @"printQuality" (map)
    
    return printerSettings;
}

+ (BRLMPTPrintSettings *)ptPrintSettingsFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    //NSDictionary<NSString*, NSObject*> * dartPrintModel = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"printerModel"];
    
    BRLMPrinterModel printerModel = [BrotherUtils printerModelFromPrinterInfoMapWithValue:map];
    
    NSDictionary<NSString *, NSObject *> * dartLabelName = (NSDictionary<NSString *, NSObject *> *)[map objectForKey:@"labelName"];
    
    LabelName * labelName = [BrotherUtils labelNameFromMapWithValue:dartLabelName];
    
    bool cutmarkPrint = [[map objectForKey:@"isCutMark"] isEqual:@(YES)];
    bool autoCut = [[map objectForKey:@"isAutoCut"] isEqual:@(YES)];
    bool halfCut = [[map objectForKey:@"isHalfCut"] isEqual:@(YES)];
    bool specialTapePrint = [[map objectForKey:@"isSpecialTape"] isEqual:@(YES)];
    
    NSDictionary<NSString *, NSObject *> * dartResolution = (NSDictionary<NSString *, NSObject *> *)[map objectForKey:@"printQuality"];
    
    bool forceVanishingMargin = [[map objectForKey:@"banishMargin"] isEqual:@(YES)];
    
    
    BRLMPTPrintSettings * printerSettings = [[BRLMPTPrintSettings alloc] initDefaultPrintSettingsWithPrinterModel:printerModel];
    
    printerSettings.labelSize = [BrotherUtils ptLabelSizeWithName:labelName];
    printerSettings.cutmarkPrint = cutmarkPrint;
    printerSettings.autoCut = autoCut;
    printerSettings.halfCut = halfCut;
    printerSettings.specialTapePrint = specialTapePrint;
    printerSettings.resolution = [BrotherUtils printResolutionFromMapWithValue:dartResolution];
    printerSettings.forceVanishingMargin = forceVanishingMargin;
    
    // chainPrint @"???"
    // highResolutionPrint @"???"
    // autoCutForEachPageCount @"???"
    //
    
    return printerSettings;
}

+ (BRLMMWPrintSettingsPaperSize)mwPaperSizeFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    NSString * name = (NSString *)[map objectForKey:@"name"];
    
    if  ([@"A7" isEqualToString:name]) {
        return BRLMMWPrintSettingsPaperSizeA7;
    }
    else if  ([@"A6" isEqualToString:name]) {
        return BRLMMWPrintSettingsPaperSizeA6;
    }
    
    
    else return BRLMMWPrintSettingsPaperSizeA6;
}
 
+ (BRLMMWPrintSettings *)mwPrintSettingsFromMapWithValue:(NSDictionary<NSString *,NSObject *> *)map {
    
    //NSDictionary<NSString*, NSObject*> * dartPrintModel = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"printerModel"];
    
    BRLMPrinterModel printerModel = [BrotherUtils printerModelFromPrinterInfoMapWithValue:map];
    
    NSDictionary<NSString*, NSObject*> * dartPaperSize = (NSDictionary<NSString*, NSObject*> *)[map objectForKey:@"paperSize"];
    
    
    BRLMMWPrintSettings * printerSettings = [[BRLMMWPrintSettings alloc] initDefaultPrintSettingsWithPrinterModel:printerModel];
    
    // TODO Ask Brother Why this is read only, seems odd.
    //printerSettings.paperSize = [BrotherUtils mwPaperSizeFromMapWithValue:dartPaperSize];
    
    return printerSettings;
}

+ (id<BRLMPrintSettingsProtocol>) printSettingsFromMapWithValue:(NSDictionary<NSString *, NSObject *> *) map {
    
    BRLMPrinterModel printerModel = [BrotherUtils printerModelFromPrinterInfoMapWithValue:map];
    
    if (printerModel == BRLMPrinterModelQL_710W
        || printerModel == BRLMPrinterModelQL_720NW
        || printerModel == BRLMPrinterModelQL_810W
        || printerModel == BRLMPrinterModelQL_1110NWB
        || printerModel == BRLMPrinterModelQL_1115NWB
        ) {
        return [BrotherUtils qlPrintSettingsFromMapWithValue:map];
    }
    else if (printerModel == BRLMPrinterModelPJ_673
             || printerModel == BRLMPrinterModelPJ_773
             || printerModel == BRLMPrinterModelPJ_763MFi
             ) {
        return [BrotherUtils pjPrintSettingsFromMapWithValue:map];
    }
    else if (printerModel == BRLMPrinterModelRJ_2050
             || printerModel == BRLMPrinterModelRJ_2140
             || printerModel == BRLMPrinterModelRJ_2150
             || printerModel == BRLMPrinterModelRJ_3050
             || printerModel == BRLMPrinterModelRJ_3150
             || printerModel == BRLMPrinterModelRJ_3250WB
             || printerModel == BRLMPrinterModelRJ_4040
             || printerModel == BRLMPrinterModelRJ_4230B
             || printerModel == BRLMPrinterModelRJ_4250WB
             ) {
        return [BrotherUtils rjPrintSettingsFromMapWithValue:map];
    }
    else if (printerModel == BRLMPrinterModelTD_2120N
             || printerModel == BRLMPrinterModelTD_2130N
             || printerModel == BRLMPrinterModelTD_4100N
             || printerModel == BRLMPrinterModelTD_4420DN
             || printerModel == BRLMPrinterModelTD_4520DN
             || printerModel == BRLMPrinterModelTD_4550DNWB
             ) {
        return [BrotherUtils tdPrintSettingsFromMapWithValue:map];
    }
    else if (printerModel == BRLMPrinterModelPT_D800W
             || printerModel == BRLMPrinterModelPT_E550W
             || printerModel == BRLMPrinterModelPT_E800W
             || printerModel == BRLMPrinterModelPT_P750W
             || printerModel == BRLMPrinterModelPT_P900W
             || printerModel == BRLMPrinterModelPT_P300BT
             || printerModel == BRLMPrinterModelPT_P710BT
             || printerModel == BRLMPrinterModelPT_P910BT
             || printerModel == BRLMPrinterModelPT_P950NW
             || printerModel == BRLMPrinterModelPT_E850TKW
             || printerModel == BRLMPrinterModelPT_P715eBT
             ) {
        return [BrotherUtils ptPrintSettingsFromMapWithValue:map];
    }
    else if (printerModel == BRLMPrinterModelMW_170
             || printerModel == BRLMPrinterModelMW_270
             || printerModel == BRLMPrinterModelMW_145MFi
             || printerModel == BRLMPrinterModelMW_260MFi
             || printerModel == BRLMPrinterModelMW_145MFi
             ) {
        return [BrotherUtils mwPrintSettingsFromMapWithValue:map];
    }
    
    return [BrotherUtils qlPrintSettingsFromMapWithValue:map];
}


+ (NSDictionary<NSString *,NSObject *> *)errorCodeToMapWithValue:(BRLMPrintErrorCode)error {
    
    NSString * errorName = @"NoError";
    if (error == BRLMPrintErrorCodeNoError) {
        errorName = @"NoError";
    }
    else if (error == BRLMPrintErrorCodePrintSettingsError) {
        errorName = @"PrintSettingsError";
    }
    else if (error == BRLMPrintErrorCodeFilepathURLError) {
        errorName = @"FilepathURLError";
    }
    else if (error == BRLMPrintErrorCodePDFPageError) {
        errorName = @"PDFPageError";
    }
    else if (error == BRLMPrintErrorCodePrintSettingsNotSupportError) {
        errorName = @"PrintSettingsNotSupportError";
    }
    else if (error == BRLMPrintErrorCodeDataBufferError) {
        errorName = @"DataBufferError";
    }
    else if (error == BRLMPrintErrorCodePrinterModelError) {
        errorName = @"PrinterModelError";
    }
    else if (error == BRLMPrintErrorCodeCanceled) {
        errorName = @"Canceled";
    }
    else if (error == BRLMPrintErrorCodeChannelTimeout) {
        errorName = @"ChannelTimeout";
    }
    else if (error == BRLMPrintErrorCodeSetModelError) {
        errorName = @"SetModelError";
    }
    else if (error == BRLMPrintErrorCodeUnsupportedFile) {
        errorName = @"UnsupportedFile";
    }
    else if (error == BRLMPrintErrorCodeSetMarginError) {
        errorName = @"SetMarginError";
    }
    else if (error == BRLMPrintErrorCodeSetLabelSizeError) {
        errorName = @"SetLabelSizeError";
    }
    else if (error == BRLMPrintErrorCodeCustomPaperSizeError) {
        errorName = @"CustomPaperSizeError";
    }
    else if (error == BRLMPrintErrorCodeSetLengthError) {
        errorName = @"SetLengthError";
    }
    else if (error == BRLMPrintErrorCodeTubeSettingError) {
        errorName = @"TubeSettingError";
    }
    else if (error == BRLMPrintErrorCodeChannelErrorStreamStatusError) {
        errorName = @"ChannelErrorStreamStatusError";
    }
    else if (error == BRLMPrintErrorCodeChannelErrorUnsupportedChannel) {
        errorName = @"ChannelErrorUnsupportedChannel";
    }
    else if (error == BRLMPrintErrorCodePrinterStatusErrorPaperEmpty) {
        errorName = @"PrinterStatusErrorPaperEmpty";
    }
    else if (error == BRLMPrintErrorCodePrinterStatusErrorCoverOpen) {
        errorName = @"PrinterStatusErrorCoverOpen";
    }
    else if (error == BRLMPrintErrorCodePrinterStatusErrorBusy) {
        errorName = @"PrinterStatusErrorBusy";
    }
    else if (error == BRLMPrintErrorCodePrinterStatusErrorPrinterTurnedOff) {
        errorName = @"PrinterStatusErrorPrinterTurnedOff";
    }
    else if (error == BRLMPrintErrorCodePrinterStatusErrorBatteryWeak) {
        errorName = @"PrinterStatusErrorBatteryWeak";
    }
    else if (error == BRLMPrintErrorCodePrinterStatusErrorExpansionBufferFull) {
        errorName = @"PrinterStatusErrorExpansionBufferFull";
    }
    else if (error == BRLMPrintErrorCodePrinterStatusErrorCommunicationError) {
        errorName = @"PrinterStatusErrorCommunicationError";
    }
    else if (error == BRLMPrintErrorCodePrinterStatusErrorPaperJam) {
        errorName = @"PrinterStatusErrorPaperJam";
    }
    else if (error == BRLMPrintErrorCodePrinterStatusErrorMediaCannotBeFed) {
        errorName = @"PrinterStatusErrorMediaCannotBeFed";
    }
    else if (error == BRLMPrintErrorCodePrinterStatusErrorOverHeat) {
        errorName = @"PrinterStatusErrorOverHeat";
    }
    else if (error == BRLMPrintErrorCodePrinterStatusErrorHighVoltageAdapter) {
        errorName = @"PrinterStatusErrorHighVoltageAdapter";
    }
    else if (error == BRLMPrintErrorCodePrinterStatusErrorUnknownError) {
        errorName = @"PrinterStatusErrorUnknownError";
    }
    else if (error == BRLMPrintErrorCodeUnknownError) {
        errorName = @"UnknownError";
    }
    NSDictionary<NSString*, NSObject *> * dartErrorCode = @{
        @"name":errorName,
        @"id": [[NSNumber alloc] initWithInt:(-1)]
    };

    return dartErrorCode;
}

+ (NSDictionary<NSString *,NSObject *> *)printerStatusToMapWithError:(BRLMPrintErrorCode)error status:(BRLMPrinterStatus *)status {
    
    NSObject * dartError = [BrotherUtils errorCodeToMapWithValue: error];
    
    // TODO Translate status if not nill
    NSDictionary<NSString*, NSObject *> * dartPrintStatus = @{
        @"errorCode":dartError,
        @"labelId": [[NSNumber alloc] initWithInt:(-1)], // TODO
        @"labelType": [[NSNumber alloc] initWithInt:(-1)], // TODO
        @"isACConnected": @{@"id": [[NSNumber alloc] initWithInt:(-1)], @"name": @"Unknown" }, // TODO
        @"isBatteryMounted": @{@"id": [[NSNumber alloc] initWithInt:(-1)], @"name": @"Unknown" }, // TODO
        @"batteryLevel": [[NSNumber alloc] initWithInt:(-1)], // TODO
        @"batteryResidualQuantityLevel":[[NSNumber alloc] initWithInt:(-1)], // TODO
        @"maxOfBatteryResidualQuantityLevel":[[NSNumber alloc] initWithInt:(-1)], // TODO
    };
    
    return dartPrintStatus;
}

+ (NSDictionary<NSString *,NSObject *> *)bRPtouchDeviceInfoToNetPrinterMap:(BRPtouchDeviceInfo *)deviceInfo {
    
    NSDictionary<NSString *, NSObject *> * dartNetPrinter = @{
        @"modelName": [deviceInfo strModelName],
              @"serNo": [deviceInfo strSerialNumber],
              @"ipAddress": [deviceInfo strIPAddress],
              @"macAddress": [deviceInfo strMACAddress],
              @"nodeName": [deviceInfo strNodeName],
              @"location": [deviceInfo strLocation]
    };
    
    return dartNetPrinter;
}

+ (NSDictionary<NSString *,NSObject *> *)bRPtouchDeviceInfoToBluetoothPrinterMap:(BRPtouchDeviceInfo *)deviceInfo {
    
    NSDictionary<NSString *, NSObject *> * dartPrinter = @{
        @"modelName": [deviceInfo strModelName],
              @"macAddress": [deviceInfo strSerialNumber],
              
    };
    
    return dartPrinter;
}

+ (NSDictionary<NSString *,NSObject *> *)bRPtouchDeviceInfoToBlePrinterMap:(BRPtouchDeviceInfo *)deviceInfo {
    
    NSDictionary<NSString *, NSObject *> * dartBlePrinter = @{
        @"localName": [deviceInfo strBLEAdvertiseLocalName]
    };
    
    return dartBlePrinter;
}


+ (NSDictionary<NSString *,NSObject *> *)cpPeripheralToBluetoothPrinterMap:(CBPeripheral *)peripheral {
    
    NSDictionary<NSString *, NSObject *> * dartPrinter = @{
        @"modelName": [peripheral name],
              @"macAddress": [peripheral identifier],
              
    };
    
    return dartPrinter;
}

+ (NSDictionary<NSString *,NSObject *> *)eaAccessoryToBluetoothPrinterMap:(EAAccessory *)accessory {
    
    
    NSDictionary<NSString *, NSObject *> * dartPrinter = @{
        @"modelName": [accessory name],
              @"macAddress": [accessory serialNumber]//[NSString stringWithFormat:@"%@",  @([accessory connectionID])]
              
    };
    
    return dartPrinter;
}

@end



@implementation LabelName
- (instancetype)initWithName:(NSString *)name model:(NSString *)model {
    self = [super init];
        if (self) {
            _name = name;
            _model = model;
            
        }
        return self;
}



@end
