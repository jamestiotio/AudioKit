//
//  AKDynamicsProcessor.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

import AVFoundation

/** AudioKit version of Apple's DynamicsProcessor Audio Unit */
public class AKDynamicsProcessor: AKNode {
    
    private let cd = AudioComponentDescription(
        componentType: kAudioUnitType_Effect,
        componentSubType: kAudioUnitSubType_DynamicsProcessor,
        componentManufacturer: kAudioUnitManufacturer_Apple,
        componentFlags: 0,
        componentFlagsMask: 0)
    
    private var internalEffect = AVAudioUnitEffect()
    private var internalAU = AudioUnit()
    
    /** Threshold (dB) ranges from -40 to 20 (Default: -20) */
    public var threshold: Float = -20 {
        didSet {
            if threshold < -40 {
                threshold = -40
            }
            if threshold > 20 {
                threshold = 20
            }
            AudioUnitSetParameter(
                internalAU,
                kDynamicsProcessorParam_Threshold,
                kAudioUnitScope_Global, 0,
                threshold, 0)
        }
    }
    
    /** Head Room (dB) ranges from 0.1 to 40.0 (Default: 5) */
    public var headRoom: Float = 5 {
        didSet {
            if headRoom < 0.1 {
                headRoom = 0.1
            }
            if headRoom > 40.0 {
                headRoom = 40.0
            }
            AudioUnitSetParameter(
                internalAU,
                kDynamicsProcessorParam_HeadRoom,
                kAudioUnitScope_Global, 0,
                headRoom, 0)
        }
    }
    
    /** Expansion Ratio (rate) ranges from 1 to 50.0 (Default: 2) */
    public var expansionRatio: Float = 2 {
        didSet {
            if expansionRatio < 1 {
                expansionRatio = 1
            }
            if expansionRatio > 50.0 {
                expansionRatio = 50.0
            }
            AudioUnitSetParameter(
                internalAU,
                kDynamicsProcessorParam_ExpansionRatio,
                kAudioUnitScope_Global, 0,
                expansionRatio, 0)
        }
    }
    
    /** Expansion Threshold (rate) ranges from 1 to 50.0 (Default: 2) */
    public var expansionThreshold: Float = 2 {
        didSet {
            if expansionThreshold < 1 {
                expansionThreshold = 1
            }
            if expansionThreshold > 50.0 {
                expansionThreshold = 50.0
            }
            AudioUnitSetParameter(
                internalAU,
                kDynamicsProcessorParam_ExpansionThreshold,
                kAudioUnitScope_Global, 0,
                expansionThreshold, 0)
        }
    }
    
    /** Attack Time (secs) ranges from 0.0001 to 0.2 (Default: 0.001) */
    public var attackTime: Float = 0.001 {
        didSet {
            if attackTime < 0.0001 {
                attackTime = 0.0001
            }
            if attackTime > 0.2 {
                attackTime = 0.2
            }
            AudioUnitSetParameter(
                internalAU,
                kDynamicsProcessorParam_AttackTime,
                kAudioUnitScope_Global, 0,
                attackTime, 0)
        }
    }
    
    /** Release Time (secs) ranges from 0.01 to 3 (Default: 0.05) */
    public var releaseTime: Float = 0.05 {
        didSet {
            if releaseTime < 0.01 {
                releaseTime = 0.01
            }
            if releaseTime > 3 {
                releaseTime = 3
            }
            AudioUnitSetParameter(
                internalAU,
                kDynamicsProcessorParam_ReleaseTime,
                kAudioUnitScope_Global, 0,
                releaseTime, 0)
        }
    }
    
    /** Master Gain (dB) ranges from -40 to 40 (Default: 0) */
    public var masterGain: Float = 0 {
        didSet {
            if masterGain < -40 {
                masterGain = -40
            }
            if masterGain > 40 {
                masterGain = 40
            }
            AudioUnitSetParameter(
                internalAU,
                kDynamicsProcessorParam_MasterGain,
                kAudioUnitScope_Global, 0,
                masterGain, 0)
        }
    }
    
    /** Compression Amount (dB) ranges from -40 to 40 (Default: 0) */
    public var compressionAmount: Float = 0 {
        didSet {
            if compressionAmount < -40 {
                compressionAmount = -40
            }
            if compressionAmount > 40 {
                compressionAmount = 40
            }
            AudioUnitSetParameter(
                internalAU,
                kDynamicsProcessorParam_CompressionAmount,
                kAudioUnitScope_Global, 0,
                compressionAmount, 0)
        }
    }
    
    /** Input Amplitude (dB) ranges from -40 to 40 (Default: 0) */
    public var inputAmplitude: Float = 0 {
        didSet {
            if inputAmplitude < -40 {
                inputAmplitude = -40
            }
            if inputAmplitude > 40 {
                inputAmplitude = 40
            }
            AudioUnitSetParameter(
                internalAU,
                kDynamicsProcessorParam_InputAmplitude,
                kAudioUnitScope_Global, 0,
                inputAmplitude, 0)
        }
    }
    
    /** Output Amplitude (dB) ranges from -40 to 40 (Default: 0) */
    public var outputAmplitude: Float = 0 {
        didSet {
            if outputAmplitude < -40 {
                outputAmplitude = -40
            }
            if outputAmplitude > 40 {
                outputAmplitude = 40
            }
            AudioUnitSetParameter(
                internalAU,
                kDynamicsProcessorParam_OutputAmplitude,
                kAudioUnitScope_Global, 0,
                outputAmplitude, 0)
        }
    }
    
    /** Initialize the dynamics processor node */
    public init(
        _ input: AKNode,
        threshold: Float = -20,
        headRoom: Float = 5,
        expansionRatio: Float = 2,
        expansionThreshold: Float = 2,
        attackTime: Float = 0.001,
        releaseTime: Float = 0.05,
        masterGain: Float = 0,
        compressionAmount: Float = 0,
        inputAmplitude: Float = 0,
        outputAmplitude: Float = 0) {
            
            self.threshold = threshold
            self.headRoom = headRoom
            self.expansionRatio = expansionRatio
            self.expansionThreshold = expansionThreshold
            self.attackTime = attackTime
            self.releaseTime = releaseTime
            self.masterGain = masterGain
            self.compressionAmount = compressionAmount
            self.inputAmplitude = inputAmplitude
            self.outputAmplitude = outputAmplitude
            super.init()
            
            internalEffect = AVAudioUnitEffect(audioComponentDescription: cd)
            output = internalEffect
            AKManager.sharedInstance.engine.attachNode(internalEffect)
            AKManager.sharedInstance.engine.connect(input.output!, to: internalEffect, format: nil)
            internalAU = internalEffect.audioUnit
            
            AudioUnitSetParameter(internalAU, kDynamicsProcessorParam_Threshold,          kAudioUnitScope_Global, 0, threshold, 0)
            AudioUnitSetParameter(internalAU, kDynamicsProcessorParam_HeadRoom,           kAudioUnitScope_Global, 0, headRoom, 0)
            AudioUnitSetParameter(internalAU, kDynamicsProcessorParam_ExpansionRatio,     kAudioUnitScope_Global, 0, expansionRatio, 0)
            AudioUnitSetParameter(internalAU, kDynamicsProcessorParam_ExpansionThreshold, kAudioUnitScope_Global, 0, expansionThreshold, 0)
            AudioUnitSetParameter(internalAU, kDynamicsProcessorParam_AttackTime,         kAudioUnitScope_Global, 0, attackTime, 0)
            AudioUnitSetParameter(internalAU, kDynamicsProcessorParam_ReleaseTime,        kAudioUnitScope_Global, 0, releaseTime, 0)
            AudioUnitSetParameter(internalAU, kDynamicsProcessorParam_MasterGain,         kAudioUnitScope_Global, 0, masterGain, 0)
            AudioUnitSetParameter(internalAU, kDynamicsProcessorParam_CompressionAmount,  kAudioUnitScope_Global, 0, compressionAmount, 0)
            AudioUnitSetParameter(internalAU, kDynamicsProcessorParam_InputAmplitude,     kAudioUnitScope_Global, 0, inputAmplitude, 0)
            AudioUnitSetParameter(internalAU, kDynamicsProcessorParam_OutputAmplitude,    kAudioUnitScope_Global, 0, outputAmplitude, 0)
    }
}
