//
//  TISensorTagServiceProfiles.swift
//  BlueCap
//
//  Created by Troy Stribling on 7/6/14.
//  Copyright (c) 2014 gnos.us. All rights reserved.
//

import Foundation
import CoreBluetooth
import BlueCapKit

public struct TISensorTag {

    //***************************************************************************************************
    // Accelerometer Service
    //***************************************************************************************************
    struct AccelerometerService {
        static let uuid = "F000AA10-0451-4000-B000-000000000000"
        static let name = "TI Accelerometer"
        // Accelerometer Data
        struct Data {
            static let uuid = "F000AA11-0451-4000-B000-000000000000"
            static let name = "Accelerometer Data"
            struct Value : DeserializedStruct {
                var xRaw:Int8
                var yRaw:Int8
                var zRaw:Int8
                var x:Float
                var y:Float
                var z:Float
                static func fromRawValues(rawValues:[Int8]) -> Value? {
                    let values = self.valuesFromRaw(rawValues)
                    return Value(xRaw:rawValues[0], yRaw:rawValues[1], zRaw:rawValues[2], x:values[0], y:values[1], z:values[2])
                }
                static func fromStrings(stringValues:Dictionary<String, String>) -> Value? {
                    let xRaw = BlueCap.int8ValueFromStringValue("xRaw", values:stringValues)
                    let yRaw = BlueCap.int8ValueFromStringValue("yRaw", values:stringValues)
                    let zRaw = BlueCap.int8ValueFromStringValue("zRaw", values:stringValues)
                    if xRaw && yRaw && zRaw {
                        let values = self.valuesFromRaw([xRaw!, yRaw!, zRaw!])
                        return Value(xRaw:xRaw!, yRaw:yRaw!, zRaw:zRaw!, x:values[0], y:values[1], z:values[2])
                    } else {
                        return nil
                    }
                }
                static func valuesFromRaw(values:[Int8]) -> [Float] {
                    return [-Float(values[0])/64.0, -Float(values[1])/64.0, Float(values[2])/64.0]
                }
                var stringValues : Dictionary<String,String> {
                    return ["x":"\(x)", "y":"\(y)", "z":"\(z)", "xRaw":"\(xRaw)", "yRaw":"\(yRaw)", "zRaw":"\(zRaw)"]
                }
                func toRawValues() -> [Int8] {
                    return [xRaw, yRaw, zRaw]
                }

            }
        }
        // Accelerometer Enabled
        struct Enabled {
            static let uuid = "F000AA12-0451-4000-B000-000000000000"
            static let name = "Accelerometer Enabled"
        }
        // Accelerometer Update Period
        struct UpdatePeriod {
            static let uuid = "F000AA13-0451-4000-B000-000000000000"
            static let name = "Accelerometer Update Period"
        }
    }
    
    //***************************************************************************************************
    // Magnetometer Service: units are uT
    //***************************************************************************************************
    struct MagnetometerService {
        static let uuid = "F000AA30-0451-4000-B000-000000000000"
        static let name = "TI Magnetometer"
        struct Data {
            static let uuid = "f000aa31-0451-4000-b000-000000000000"
            static let name = "Magnetometer Data"
            struct Value : DeserializedStruct {
                var xRaw    : Int16
                var yRaw    : Int16
                var zRaw    : Int16
                var x       : Double
                var y       : Double
                var z       : Double
                static func fromRawValues(rawValues:[Int16]) -> Value? {
                    let values = self.valuesFromRaw(rawValues)
                    return Value(xRaw:rawValues[0], yRaw:rawValues[1], zRaw:rawValues[2], x:values[0], y:values[1], z:values[2])
                }
                static func fromStrings(stringValues:Dictionary<String, String>) -> Value? {
                    let xRaw = BlueCap.int16ValueFromStringValue("xRaw", values:stringValues)
                    let yRaw = BlueCap.int16ValueFromStringValue("yRaw", values:stringValues)
                    let zRaw = BlueCap.int16ValueFromStringValue("zRaw", values:stringValues)
                    if xRaw && yRaw && zRaw {
                        let values = self.valuesFromRaw([xRaw!, yRaw!, zRaw!])
                        return Value(xRaw:xRaw!, yRaw:yRaw!, zRaw:zRaw!, x:values[0], y:values[1], z:values[2])
                    } else {
                        return nil
                    }
                }
                static func valuesFromRaw(values:[Int16]) -> [Double] {
                    return [-Double(values[0])*2000.0/65536.0, -Double(values[1])*2000.0/65536.0, Double(values[2])*2000.0/65536.0]
                }
                var stringValues : Dictionary<String,String> {
                    return ["x":"\(x)", "y":"\(y)", "z":"\(z)", "xRaw":"\(xRaw)", "yRaw":"\(yRaw)", "zRaw":"\(zRaw)"]
                }
                func toRawValues() -> [Int16] {
                    return [xRaw, yRaw, zRaw]
                }
            }
        }
        struct Enabled {
            static let uuid = "f000aa32-0451-4000-b000-000000000000"
            static let name = "Magnetometer Enabled"
        }
        struct UpdatePeriod {
            static let uuid = "f000aa33-0451-4000-b000-000000000000"
            static let name = "Magnetometer Update Period"
        }
    }

    //***************************************************************************************************
    // Gyroscope Service: units are degrees
    //***************************************************************************************************
    struct GyroscopeService {
        static let uuid = "F000AA50-0451-4000-B000-000000000000"
        static let name = "TI Gyroscope"
        struct Data {
            static let uuid = "f000aa51-0451-4000-b000-000000000000"
            static let name = "Gyroscope Data"
            struct Value : DeserializedStruct {
                var xRaw    : Int16
                var yRaw    : Int16
                var zRaw    : Int16
                var x       : Double
                var y       : Double
                var z       : Double
                static func fromRawValues(rawValues:[Int16]) -> Value? {
                    let values = self.valuesFromRaw(rawValues)
                    return Value(xRaw:rawValues[0], yRaw:rawValues[1], zRaw:rawValues[2], x:values[0], y:values[1], z:values[2])
                }
                static func fromStrings(stringValues:Dictionary<String, String>) -> Value? {
                    let xRaw = BlueCap.int16ValueFromStringValue("xRaw", values:stringValues)
                    let yRaw = BlueCap.int16ValueFromStringValue("yRaw", values:stringValues)
                    let zRaw = BlueCap.int16ValueFromStringValue("zRaw", values:stringValues)
                    if xRaw && yRaw && zRaw {
                        let values = self.valuesFromRaw([xRaw!, yRaw!, zRaw!])
                        return Value(xRaw:xRaw!, yRaw:yRaw!, zRaw:zRaw!, x:values[0], y:values[1], z:values[2])
                    } else {
                        return nil
                    }
                }
                static func valuesFromRaw(values:[Int16]) -> [Double] {
                    return [-Double(values[0])*500.0/65536.0, -Double(values[1])*500.0/65536.0, Double(values[2])*500.0/65536.0]
                }
                var stringValues : Dictionary<String,String> {
                    return ["x":"\(x)", "y":"\(y)", "z":"\(z)", "xRaw":"\(xRaw)", "yRaw":"\(yRaw)", "zRaw":"\(zRaw)"]
                }
                func toRawValues() -> [Int16] {
                    return [xRaw, yRaw, zRaw]
                }
            }
        }
        struct Enabled {
            static let uuid = "f000aa52-0451-4000-b000-000000000000"
            static let name = "Gyroscope Enabled"
            enum Value : UInt8, DeserializedEnum {
                case No         = 0
                case XAxis      = 1
                case YAxis      = 2
                case XYAxis     = 3
                case ZAxis      = 4
                case XZAxis     = 5
                case YZAxis     = 6
                case XYZAxis    = 7
                static func fromRaw(rawValue:UInt8) -> Value? {
                    switch rawValue {
                    case 0:
                        return Value.No
                    case 1:
                        return Value.XAxis
                    case 2:
                        return Value.YAxis
                    case 3:
                        return Value.XYAxis
                    case 4:
                        return Value.ZAxis
                    case 5:
                        return Value.XZAxis
                    case 6:
                        return Value.YZAxis
                    case 7:
                        return Value.XYZAxis
                    default:
                        return nil
                    }
                }
                static func fromString(stringValue:String) -> Value? {
                    switch stringValue {
                    case "No":
                        return Value.No
                    case "XAxis":
                        return Value.XAxis
                    case "YAxis":
                        return Value.YAxis
                    case "XYAxis":
                        return Value.XYAxis
                    case "ZAxis":
                        return Value.ZAxis
                    case "XZAxis":
                        return Value.XZAxis
                    case "YZAxis":
                        return Value.YZAxis
                    case "XYZAxis":
                        return Value.XYZAxis
                    default:
                        return nil
                    }
                }
                static func stringValues() -> [String] {
                    return ["No", "XAxis", "YAxis", "XYAxis", "ZAxis", "XZAxis", "YZAxis", "XYZAxis"]
                }
                var stringValue : String {
                    switch self {
                    case .No:
                        return "No"
                    case .XAxis:
                        return "XAxis"
                    case .YAxis:
                        return "YAxis"
                    case .XYAxis:
                        return "XYAxis"
                    case .ZAxis:
                        return "ZAxis"
                    case .XZAxis:
                        return "XZAxis"
                    case .YZAxis:
                        return "YZAxis"
                    case .XYZAxis:
                        return "XYZAxis"
                    }
                }
                func toRaw() -> UInt8 {
                    switch self {
                    case .No:
                        return 0
                    case .XAxis:
                        return 1
                    case .YAxis:
                        return 2
                    case .XYAxis:
                        return 3
                    case .ZAxis:
                        return 4
                    case .XZAxis:
                        return 5
                    case .YZAxis:
                        return 6
                    case .XYZAxis:
                        return 7
                    }
                }
            }
        }
    }

    //***************************************************************************************************
    // Temperature Service units Celsius
    //***************************************************************************************************
    struct TemperatureService {
        static let uuid = "F000AA00-0451-4000-B000-000000000000"
        static let name = "TI Temperature"
        struct Data {
            static let uuid = "f000aa01-0451-4000-b000-000000000000"
            static let name = "Temperature Data"
            struct Value : DeserializedStruct {
                var objectRaw   : Int16
                var ambientRaw  : Int16
                var object      : Double
                var ambient     : Double
                static func fromRawValues(rawValues:[Int16]) -> Value? {
                    let (object, ambient) = self.valuesFromRaw(rawValues[0], ambientRaw:rawValues[1])
                    return Value(objectRaw:rawValues[0], ambientRaw:rawValues[1], object:object, ambient:ambient)
                }
                static func fromStrings(stringValues:Dictionary<String, String>) -> Value? {
                    let objectRaw = BlueCap.int16ValueFromStringValue("objectRaw", values:stringValues)
                    let ambientRaw = BlueCap.int16ValueFromStringValue("ambientRaw", values:stringValues)
                    if objectRaw && ambientRaw {
                        let (object, ambient) = self.valuesFromRaw(objectRaw!, ambientRaw:ambientRaw!)
                        return Value(objectRaw:objectRaw!, ambientRaw:ambientRaw!, object:object, ambient:ambient)
                    } else {
                        return nil
                    }
                }
                static func valuesFromRaw(objectRaw:Int16, ambientRaw:Int16) -> (Double, Double) {
                    let ambient = Double(ambientRaw)/128.0;
                    let vObj2 = Double(objectRaw)*0.00000015625;
                    let tDie2 = ambient + 273.15;
                    let s0 = 6.4*pow(10,-14);
                    let a1 = 1.75*pow(10,-3);
                    let a2 = -1.678*pow(10,-5);
                    let b0 = -2.94*pow(10,-5);
                    let b1 = -5.7*pow(10,-7);
                    let b2 = 4.63*pow(10,-9);
                    let c2 = 13.4;
                    let tRef = 298.15;
                    let s = s0*(1+a1*(tDie2 - tRef)+a2*pow((tDie2 - tRef),2));
                    let vOs = b0 + b1*(tDie2 - tRef) + b2*pow((tDie2 - tRef),2);
                    let fObj = (vObj2 - vOs) + c2*pow((vObj2 - vOs),2);
                    let object = pow(pow(tDie2,4) + (fObj/s),0.25) - 273.15;
                    return (object, ambient)
                }
                var stringValues : Dictionary<String,String> {
                    return ["objectRaw":"\(objectRaw)", "ambientRaw":"\(ambientRaw)", "object":"\(object)", "ambient":"\(ambient)"]
                }
                func toRawValues() -> [Int16] {
                    return [objectRaw, ambientRaw]
                }
            }
        }
        struct Enabled {
            static let uuid = "f000aa02-0451-4000-b000-000000000000"
            static let name = "Temperature Enabled"
        }
    }

    //***************************************************************************************************
    // Barometer Service
    //***************************************************************************************************
    struct BarometerService {
        static let uuid = "F000AA40-0451-4000-B000-000000000000"
        static let name = "TI Barometer"
        struct Data {
            static let uuid = "f000aa41-0451-4000-b000-000000000000"
            static let name = "Baraometer Data"
        }
        struct Calibration {
            static let uuid = "f000aa42-0451-4000-b000-000000000000"
            static let name = "Baraometer Calibration Data"
        }
        struct Enabled {
            static let uuid = "f000aa43-0451-4000-b000-000000000000"
            static let name = "Baraometer Enabled"
        }
    }

    //***************************************************************************************************
    // Hygrometer Service
    // Temperature units Celsius
    // Humidity units Relative Humdity
    //***************************************************************************************************
    struct HygrometerService {
        static let uuid = "F000AA20-0451-4000-B000-000000000000"
        static let name = "TI Hygrometer"
        struct Data {
            static let uuid = "f000aa21-0451-4000-b000-000000000000"
            static let name = "Hygrometer Data"
            struct Value : DeserializedStruct {
                var temperatureRaw  : UInt16
                var humidityRaw     : UInt16
                var temperature     : Double
                var humidity        : Double
                static func fromRawValues(rawValues:[UInt16]) -> Value? {
                    let (temperature, humidity) = self.valuesFromRaw(rawValues[0], humidityRaw:rawValues[1])
                    return Value(temperatureRaw:rawValues[0], humidityRaw:rawValues[1], temperature:temperature, humidity:humidity)
                }
                static func fromStrings(stringValues:Dictionary<String, String>) -> Value? {
                    let temperatureRaw = BlueCap.uint16ValueFromStringValue("temperatureRaw", values:stringValues)
                    let humidityRaw = BlueCap.uint16ValueFromStringValue("humidityRaw", values:stringValues)
                    if temperatureRaw && humidityRaw {
                        let (temperature, humidity) = self.valuesFromRaw(temperatureRaw!, humidityRaw:humidityRaw!)
                        return Value(temperatureRaw:temperatureRaw!, humidityRaw:humidityRaw!, temperature:temperature, humidity:humidity)
                    } else {
                        return nil
                    }
                }
                static func valuesFromRaw(temperatureRaw:UInt16, humidityRaw:UInt16) -> (Double, Double) {
                    return (-46.86+175.72*Double(temperatureRaw)/65536.0, -6.0+125.0*Double(humidityRaw)/65536.0)
                }
                var stringValues : Dictionary<String,String> {
                    return ["temperatureRae":"\(temperatureRaw)", "humidityRaw":"\(humidityRaw)", "temperature":"\(temperature)", "humidity":"\(humidity)"]
                }
                func toRawValues() -> [UInt16] {
                    return [temperatureRaw, humidityRaw]
                }
            }
        }
        struct Enabled {
            static let uuid = "f000aa22-0451-4000-b000-000000000000"
            static let name = "Hygrometer Enabled"
        }
    }

    //***************************************************************************************************
    // Sensor Tag Test Service
    //***************************************************************************************************
    struct SensorTagTestService {
        static let uuid = "F000AA60-0451-4000-B000-000000000000"
        static let name = "TI Sensor Tag Test"
        struct Data {
            static let uuid = "f000aa61-0451-4000-b000-000000000000"
            static let name = "Test Data"
            struct Value : DeserializedStruct {
                var resultRaw : UInt8
                var test1 : UInt8
                var test2 : UInt8
                var test3 : UInt8
                var test4 : UInt8
                var test5 : UInt8
                var test6 : UInt8
                var test7 : UInt8
                var test8 : UInt8
                static func fromRawValues(rawValues:[UInt8]) -> Value? {
                    return nil
                }
                static func fromStrings(stringValues:Dictionary<String, String>) -> Value? {
                    return nil
                }
                static func valuesFromRaw(rawValue:UInt8) -> [UInt8] {
                    return [self.testResult(rawValue, position:0), self.testResult(rawValue, position:1),
                            self.testResult(rawValue, position:2), self.testResult(rawValue, position:3),
                            self.testResult(rawValue, position:4), self.testResult(rawValue, position:5),
                            self.testResult(rawValue, position:6), self.testResult(rawValue, position:7)]
                }
                static func testResult(rawResult:UInt8, position:UInt8) -> UInt8 {
                    return rawResult & (1 << position)
                }
                var stringValues : Dictionary<String,String> {
                    return ["resultRaw":"\(resultRaw)", "test1":"\(self.testResultStringValue(test1))",
                            "test2":"\(self.testResultStringValue(test2))", "test3":"\(self.testResultStringValue(test3))",
                            "test4":"\(self.testResultStringValue(test4))", "test5":"\(self.testResultStringValue(test5))",
                            "test6":"\(self.testResultStringValue(test6))", "test7":"\(self.testResultStringValue(test7))",
                            "test8":"\(self.testResultStringValue(test8))"]
                }
                func testResultStringValue(value:UInt8) -> String {
                    return value == 1 ? "PASSED" : "FAILED"
                }
                func toRawValues() -> [UInt8] {
                    return [resultRaw]
                }
            }
        }
        struct Enabled {
            static let uuid = "f000aa62-0451-4000-b000-000000000000"
            static let name = "Test Enabled"
        }
    }

    //***************************************************************************************************
    // Key Pressed Service
    //***************************************************************************************************
    struct KeyPressedService {
        static let uuid = "ffe0"
        static let name = "Sensor Tag Key Pressed"
        struct Data {
            static let uuid = "ffe1"
            static let name = "Key Pressed"
        }
    }
    
    //***************************************************************************************************
    // Common
    //***************************************************************************************************
    struct UInt8Period : DeserializedStruct {
        var periodRaw   : UInt8
        var period      : UInt16
        static func fromRawValues(rawValues:[UInt8]) -> UInt8Period? {
            var period = 10*UInt16(rawValues[0])
            if period < 10 {
                period = 10
            }
            return UInt8Period(periodRaw:rawValues[0], period:period)
        }
        static func fromStrings(stringValues:Dictionary<String, String>) -> UInt8Period? {
            if let period = BlueCap.uint16ValueFromStringValue("period", values:stringValues) {
                let periodRaw = self.periodRawFromPeriod(period)
                return UInt8Period(periodRaw:periodRaw, period:10*period)
            } else {
                return nil
            }
        }
        static func periodRawFromPeriod(period:UInt16) -> UInt8 {
            let periodRaw = period/10
            if periodRaw > 255 {
                return 255
            } else if periodRaw < 10 {
                return 10
            } else {
                return UInt8(periodRaw)
            }
        }
        var stringValues : Dictionary<String,String> {
        return ["periodRaw":"\(periodRaw)", "period":"\(period)"]
        }
        func toRawValues() -> [UInt8] {
            return [periodRaw]
        }
    }
    enum Enabled: UInt8, DeserializedEnum {
        case No     = 0
        case Yes    = 1
        static func fromRaw(rawValue:UInt8) -> Enabled? {
            switch rawValue {
            case 0:
                return Enabled.No
            case 1:
                return Enabled.Yes
            default:
                return nil
            }
        }
        static func fromString(stringValue:String) -> Enabled? {
            switch stringValue {
            case "No":
                return Enabled.No
            case "Yes":
                return Enabled.Yes
            default:
                return nil
            }
        }
        static func stringValues() -> [String] {
            return ["No", "Yes"]
        }
        var stringValue : String {
        switch self {
        case .No:
            return "No"
        case .Yes:
            return "Yes"
            }
        }
        func toRaw() -> UInt8 {
            switch self {
            case .No:
                return 0
            case .Yes:
                return 1
            }
        }
    }
}

public class TISensorTagServiceProfiles {
    
    public class func create() {

        let profileManager = ProfileManager.sharedInstance()
        
        //***************************************************************************************************
        // Accelerometer Service
        //***************************************************************************************************
        profileManager.addService(ServiceProfile(uuid:TISensorTag.AccelerometerService.uuid, name:TISensorTag.AccelerometerService.name){(serviceProfile) in
            // Accelerometer Data
            serviceProfile.addCharacteristic(StructCharacteristicProfile<TISensorTag.AccelerometerService.Data.Value>(uuid:TISensorTag.AccelerometerService.Data.uuid, name:TISensorTag.AccelerometerService.Data.name)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serialize(TISensorTag.AccelerometerService.Data.Value.fromRawValues([-2, 6, 69]))
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Notify
            })
            // Accelerometer Enabled
            serviceProfile.addCharacteristic(EnumCharacteristicProfile<TISensorTag.Enabled>(uuid:TISensorTag.AccelerometerService.Enabled.uuid, name:TISensorTag.AccelerometerService.Enabled.name)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serialize(TISensorTag.Enabled.No)
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Write
                    characteristicProfile.afterDiscovered(){(characteristic:Characteristic) in
                        characteristic.write(TISensorTag.Enabled.Yes, afterWriteSuccessCallback:{})
                    }
                })
            // Accelerometer Update Period
            serviceProfile.addCharacteristic(StructCharacteristicProfile<TISensorTag.UInt8Period>(uuid:TISensorTag.AccelerometerService.UpdatePeriod.uuid, name:TISensorTag.AccelerometerService.UpdatePeriod.name)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serialize(0x64 as UInt8)
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Write
                })
        })
        
        //***************************************************************************************************
        // Magnetometer Service
        //***************************************************************************************************
        profileManager.addService(ServiceProfile(uuid:TISensorTag.MagnetometerService.uuid, name:TISensorTag.MagnetometerService.name){(serviceProfile) in
            // Magentometer Data
            serviceProfile.addCharacteristic(StructCharacteristicProfile<TISensorTag.MagnetometerService.Data.Value>(uuid:TISensorTag.MagnetometerService.Data.uuid, name:TISensorTag.MagnetometerService.Data.name, fromEndianness:.Little)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serializeToLittleEndian(TISensorTag.MagnetometerService.Data.Value.fromRawValues([-2183, 1916, 1255]))
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Notify
                })
            // Magnetometer Enabled
            serviceProfile.addCharacteristic(EnumCharacteristicProfile<TISensorTag.Enabled>(uuid:TISensorTag.MagnetometerService.Enabled.uuid, name: TISensorTag.MagnetometerService.Enabled.name)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serialize(TISensorTag.Enabled.No)
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Write
                    characteristicProfile.afterDiscovered(){(characteristic:Characteristic) in
                        characteristic.write(TISensorTag.Enabled.Yes, afterWriteSuccessCallback:{})
                    }
                })
            // Magnetometer Update Period
            serviceProfile.addCharacteristic(StructCharacteristicProfile<TISensorTag.UInt8Period>(uuid:TISensorTag.MagnetometerService.UpdatePeriod.uuid, name:TISensorTag.MagnetometerService.UpdatePeriod.name)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serialize(0x64 as UInt8)
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Write
                })
        })

        //***************************************************************************************************
        // Gyroscope Service
        //***************************************************************************************************
        profileManager.addService(ServiceProfile(uuid:TISensorTag.GyroscopeService.uuid, name:TISensorTag.GyroscopeService.name){(serviceProfile) in
            // Gyroscope Data
            serviceProfile.addCharacteristic(StructCharacteristicProfile<TISensorTag.GyroscopeService.Data.Value>(uuid:TISensorTag.GyroscopeService.Data.uuid, name:TISensorTag.GyroscopeService.Data.name, fromEndianness:.Little)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serializeToLittleEndian(TISensorTag.GyroscopeService.Data.Value.fromRawValues([-24, -219, -23]))
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Notify
                })
            // Gyroscope Enables
            serviceProfile.addCharacteristic(EnumCharacteristicProfile<TISensorTag.GyroscopeService.Enabled.Value>(uuid:TISensorTag.GyroscopeService.Enabled.uuid, name:TISensorTag.GyroscopeService.Enabled.name)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serialize(TISensorTag.GyroscopeService.Enabled.Value.No)
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Write
                    characteristicProfile.afterDiscovered(){(characteristic:Characteristic) in
                        characteristic.write(TISensorTag.GyroscopeService.Enabled.Value.XYZAxis, afterWriteSuccessCallback:{})
                    }
                })
        })

        //***************************************************************************************************
        // Temperature Service
        //***************************************************************************************************
        profileManager.addService(ServiceProfile(uuid:TISensorTag.TemperatureService.uuid, name:TISensorTag.TemperatureService.name){(serviceProfile) in
            // Temperature Data
            serviceProfile.addCharacteristic(StructCharacteristicProfile<TISensorTag.TemperatureService.Data.Value>(uuid:TISensorTag.TemperatureService.Data.uuid, name:TISensorTag.TemperatureService.Data.name, fromEndianness:.Little)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serializeToLittleEndian(TISensorTag.GyroscopeService.Data.Value.fromRawValues([-24, -219, -23]))
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Notify
                })
            // Temperature Enabled
            serviceProfile.addCharacteristic(EnumCharacteristicProfile<TISensorTag.Enabled>(uuid:TISensorTag.TemperatureService.Enabled.uuid, name:TISensorTag.TemperatureService.Enabled.name)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serialize(TISensorTag.Enabled.No)
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Write
                    characteristicProfile.afterDiscovered(){(characteristic:Characteristic) in
                        characteristic.write(TISensorTag.Enabled.Yes, afterWriteSuccessCallback:{})
                    }
                })
        })

        //***************************************************************************************************
        // Barometer Service
        //***************************************************************************************************
        profileManager.addService(ServiceProfile(uuid:TISensorTag.BarometerService.uuid, name:TISensorTag.BarometerService.name){(serviceProfile) in
            // Barometer Data
            // Barometer Calibration
            // Baromter Enabled
        })

        //***************************************************************************************************
        // Hygrometer Service
        //***************************************************************************************************
        profileManager.addService(ServiceProfile(uuid:TISensorTag.HygrometerService.uuid, name:TISensorTag.HygrometerService.name){(serviceProfile) in
            // Hygrometer Data
            serviceProfile.addCharacteristic(StructCharacteristicProfile<TISensorTag.HygrometerService.Data.Value>(uuid:TISensorTag.HygrometerService.uuid, name:TISensorTag.HygrometerService.name, fromEndianness:.Little)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serializeToLittleEndian(TISensorTag.HygrometerService.Data.Value.fromRawValues([2600, 3500]))
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Notify
                })
            // Hygrometer Enabled
            serviceProfile.addCharacteristic(EnumCharacteristicProfile<TISensorTag.Enabled>(uuid:TISensorTag.HygrometerService.Enabled.uuid, name:TISensorTag.HygrometerService.Enabled.name)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serialize(TISensorTag.Enabled.No)
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Write
                    characteristicProfile.afterDiscovered(){(characteristic:Characteristic) in
                        characteristic.write(TISensorTag.Enabled.Yes, afterWriteSuccessCallback:{})
                    }
                })
        })

        //***************************************************************************************************
        // Sensor Tag Test Service
        //***************************************************************************************************
        profileManager.addService(ServiceProfile(uuid:TISensorTag.SensorTagTestService.uuid, name:TISensorTag.SensorTagTestService.name){(serviceProfile) in
            // Test Data
            // Test Enabled
            serviceProfile.addCharacteristic(EnumCharacteristicProfile<TISensorTag.Enabled>(uuid:TISensorTag.SensorTagTestService.Enabled.uuid, name:TISensorTag.SensorTagTestService.Enabled.name)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serialize(TISensorTag.Enabled.No)
                    characteristicProfile.properties = CBCharacteristicProperties.Read | CBCharacteristicProperties.Write
                })
        })

        //***************************************************************************************************
        // Key Pressed Service
        //***************************************************************************************************
        profileManager.addService(ServiceProfile(uuid:TISensorTag.KeyPressedService.uuid, name:TISensorTag.KeyPressedService.name){(serviceProfile) in
            serviceProfile.addCharacteristic(DeserializedCharacteristicProfile<UInt8>(uuid:TISensorTag.KeyPressedService.Data.uuid, name:TISensorTag.KeyPressedService.Data.name)
                {(characteristicProfile) in
                    characteristicProfile.initialValue = NSData.serialize(0x01 as UInt8)
                    characteristicProfile.properties = CBCharacteristicProperties.Notify
                })
        })

    }
}
