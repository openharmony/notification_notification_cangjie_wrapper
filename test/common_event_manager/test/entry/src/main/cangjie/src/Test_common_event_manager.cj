/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos_app_cangjie_entry

internal import ohos.ark_interop.*
internal import kit.PerformanceAnalysisKit.Hilog
internal import kit.BasicServicesKit.*
internal import kit.BasicServicesKit.ValueType as CEMValueType
internal import ohos.base.*
internal import std.runtime.*
internal import std.sync.*
internal import std.time.*
import std.unittest.testmacro.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import std.collection.HashMap
import ohos.business_exception.*
import kit.PerformanceAnalysisKit.Hilog

@Test
class Test_common_event_manager {
    override func afterAll(): Unit {
        gc()
        sleepFor(1.second)
    }

    let support1 = CommonEventSupport
        .COMMON_EVENT_SCREEN_ON

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCreateSubscribeInfo(): Unit {
        let events = [support1]
        let info = CommonEventSubscribeInfo(events, priority: 100000)
        Hilog.info(0, "TestCEM", "priority = ${info.priority}")
        Hilog.info(0, "TestCEM", "publisherPermission = ${info.publisherPermission}")
        Hilog.info(0, "TestCEM", "publisherDeviceId = ${info.publisherDeviceId}")
        Hilog.info(0, "TestCEM", "userId = ${info.userId}")
        Hilog.info(0, "TestCEM", "publisherBundleName = ${info.publisherBundleName}")
        CommonEventManager.createSubscriber(info)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCreateSubscribe(): Unit {
        let events = [support1]
        let info = CommonEventSubscribeInfo(events)
        let sub = CommonEventManager.createSubscriber(info)
        CommonEventManager.publish(support1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSubscribeAndPublish(): Unit {
        let events = [support1]
        let info = CommonEventSubscribeInfo(events)
        let sub = CommonEventManager.createSubscriber(info)
        let strV = CEMValueType.StringValue("Hello")
        let intV = CEMValueType.Int32Value(11)
        let parameters = HashMap<String, CEMValueType>()
        parameters.add("123", strV)
        parameters.add("321", intV)
        func callback(err: ?BusinessException, c: ?CommonEventData): Unit {
            Hilog.info(0, "TestCEM", "=======================================")
            Hilog.info(0, "TestCEM", "event of p is = ${c?.event}")
            Hilog.info(0, "TestCEM", "p of p is = ${c?.parameters.size}")
            Hilog.info(0, "TestCEM", "callback excute success!")
        }
        let pData = CommonEventPublishData(bundleName: "com.example.myapplication", data: "newbee", code: 123321)

        CommonEventManager.subscribe(sub, callback)
        CommonEventManager.publish(support1, options: pData)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testUnsubscribe(): Unit {
        let events = [support1]
        let info = CommonEventSubscribeInfo(events)
        let sub = CommonEventManager.createSubscriber(info)
        func callback(err: ?BusinessException, c: ?CommonEventData): Unit {
            Hilog.info(0, "TestCEM", "Should not reach here!")
        }
        let pData = CommonEventPublishData(bundleName: "com.example.myapplication", data: "newbee", code: 123321)
        CommonEventManager.subscribe(sub, callback)
        CommonEventManager.unsubscribe(sub)
        CommonEventManager.publish(support1, options: pData)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testSelfDefinedEvent(): Unit {
        let events = ["Support.Commoneventscreenon"]
        let info00 = CommonEventSubscribeInfo(events)
        let sub00 = CommonEventManager.createSubscriber(info00)
        let parameter = HashMap<String, CEMValueType>()
        parameter.add("1", CEMValueType.BoolValue(true))
        parameter.add("2", CEMValueType.Int32Value(1))
        parameter.add("3", CEMValueType.Float64Value(1.1))
        parameter.add("4", CEMValueType.FD(4))
        parameter.add("5", CEMValueType.StringValue("5"))
        parameter.add("6", CEMValueType.ArrayBool([false, true]))
        parameter.add("7", CEMValueType.ArrayInt32([3, 4]))
        parameter.add("8", CEMValueType.ArrayInt64([4, 4]))
        parameter.add("9", CEMValueType.ArrayFloat64([4.5, 4.5]))
        parameter.add("10", CEMValueType.ArrayString(["5+5", "=10"]))
        parameter.add("11", CEMValueType.ArrayFD([5, 6, 7]))
        let commonEventPublishData00 = CommonEventPublishData(bundleName: "com.example.myapplication",
            data: "initial data", code: 123321, parameters: parameter)
        func delayMs(d: Int64): Unit {
            let start = MonoTime.now()
            while (MonoTime.now() < start + Duration.millisecond * d) {}
        }
        let isCallBackCalled = AtomicBool(false)
        let callBack = {
            err: ?BusinessException, commonEventData: ?CommonEventData =>
            Hilog.info(0, "CangjieTest", "callback start")
            @Expect(commonEventData?.event, "Support.Commoneventscreenon")
            @Expect(commonEventData?.code == 123321)
            @Expect(commonEventData?.data == "initial data")
            isCallBackCalled.store(true)
        }
        CommonEventManager.subscribe(sub00, callBack)
        @Expect(!isCallBackCalled.load())
        CommonEventManager.publish("Support.Commoneventscreenon", options: commonEventPublishData00)
        delayMs(1000)
        @Expect(isCallBackCalled.load())
        delayMs(1000)
        CommonEventManager.unsubscribe(sub00)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPriority(): Unit {
        let events = [support1]
        let info1 = CommonEventSubscribeInfo(events)
        let info2 = CommonEventSubscribeInfo(events, priority: 5)
        Hilog.info(0, "TestCEM", "info1 priority = ${info1.priority}")
        Hilog.info(0, "TestCEM", "info2 priority = ${info2.priority}")
        let sub1 = CommonEventManager.createSubscriber(info1)
        let sub2 = CommonEventManager.createSubscriber(info2)
        func callback1(err: ?BusinessException, c: ?CommonEventData): Unit {
            Hilog.info(0, "TestCEM", "1111111111111111111111111111111111")
        }

        func callback2(err: ?BusinessException, c: ?CommonEventData): Unit {
            Hilog.info(0, "TestCEM", "222222222222222222222222222222222")
        }
        let pData = CommonEventPublishData(bundleName: "com.example.myapplication", data: "newbee", code: 123321)

        CommonEventManager.subscribe(sub1, callback1)
        CommonEventManager.subscribe(sub2, callback2)
        CommonEventManager.publish(support1, options: pData)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testPermissions(): Unit {
        func callback(err: ?BusinessException, c: ?CommonEventData): Unit {
            Hilog.info(0, "TestCEM", "callback suceess!")
            if (let Some(v) <- c) {
                Hilog.info(0, "TestCEM", "${v.parameters.size}")
                for (i in 0..v.parameters.size) {
                    let value = v.parameters.get("1").getOrThrow()
                    match (value) {
                        case CEMValueType.ArrayInt64(v) => Hilog.info(0, "TestCEM", "arr I64 = ${v}")
                        case _ => Hilog.info(0, "TestCEM", "None")
                    }
                }
            }
        }

        let events = [support1]
        let info = CommonEventSubscribeInfo(events)
        let sub = CommonEventManager.createSubscriber(info)
        let parameters = HashMap<String, CEMValueType>()
        parameters.add("1", CEMValueType.Int32Value(1))
        parameters.add("2", CEMValueType.Float64Value(1.1))
        parameters.add("3", CEMValueType.StringValue("111"))
        parameters.add("4", CEMValueType.BoolValue(true))
        parameters.add("5", CEMValueType.FD(1))
        parameters.add("6", CEMValueType.ArrayString(["123"]))
        parameters.add("7", CEMValueType.ArrayInt32([1, 2]))
        parameters.add("8", CEMValueType.ArrayInt64([1, 2]))
        parameters.add("9", CEMValueType.ArrayBool([true, false]))
        parameters.add("10", CEMValueType.ArrayFloat64([1.1, 2.1]))
        parameters.add("11", CEMValueType.ArrayFD([1, 2]))
        let pData = CommonEventPublishData(bundleName: "com.example.myapplication", data: "newbee", code: 123321,
            subscriberPermissions: ["123321"], parameters: parameters)
        CommonEventManager.subscribe(sub, callback)
        CommonEventManager.publish(support1, options: pData)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_support_value1(): Unit {
        CommonEventSupport()
        @Expect(CommonEventSupport.COMMON_EVENT_ABILITY_ADDED, "common.event.ABILITY_ADDED")
        @Expect(CommonEventSupport.COMMON_EVENT_ABILITY_REMOVED, "common.event.ABILITY_REMOVED")
        @Expect(CommonEventSupport.COMMON_EVENT_ABILITY_UPDATED, "common.event.ABILITY_UPDATED")
        @Expect(CommonEventSupport.COMMON_EVENT_ACCOUNT_DELETED, "usual.event.data.ACCOUNT_DELETED")
        @Expect(CommonEventSupport.COMMON_EVENT_AIRPLANE_MODE_CHANGED, "usual.event.AIRPLANE_MODE")
        @Expect(CommonEventSupport.COMMON_EVENT_BATTERY_CHANGED, "usual.event.BATTERY_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_BATTERY_LOW, "usual.event.BATTERY_LOW")
        @Expect(CommonEventSupport.COMMON_EVENT_BATTERY_OKAY, "usual.event.BATTERY_OKAY")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_UPDATE, "usual.event.bluetooth.handsfree.ag.CONNECT_STATE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CURRENT_DEVICE_UPDATE, "usual.event.bluetooth.handsfree.ag.CURRENT_DEVICE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_AUDIO_STATE_UPDATE, "usual.event.bluetooth.handsfree.ag.AUDIO_STATE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_UPDATE, "usual.event.bluetooth.a2dpsource.CONNECT_STATE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CURRENT_DEVICE_UPDATE, "usual.event.bluetooth.a2dpsource.CURRENT_DEVICE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_PLAYING_STATE_UPDATE, "usual.event.bluetooth.a2dpsource.PLAYING_STATE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_UPDATE, "usual.event.bluetooth.a2dpsource.AVRCP_CONNECT_STATE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_UPDATE, "usual.event.bluetooth.a2dpsource.CODEC_VALUE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_DISCOVERED, "usual.event.bluetooth.remotedevice.DISCOVERED")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CLASS_VALUE_UPDATE, "usual.event.bluetooth.remotedevice.CLASS_VALUE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_CONNECTED, "usual.event.bluetooth.remotedevice.ACL_CONNECTED")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_DISCONNECTED, "usual.event.bluetooth.remotedevice.ACL_DISCONNECTED")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_NAME_UPDATE, "usual.event.bluetooth.remotedevice.NAME_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE, "usual.event.bluetooth.remotedevice.PAIR_STATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_BATTERY_VALUE_UPDATE, "usual.event.bluetooth.remotedevice.BATTERY_VALUE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_SDP_RESULT, "usual.event.bluetooth.remotedevice.SDP_RESULT")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_UUID_VALUE, "usual.event.bluetooth.remotedevice.UUID_VALUE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_REQ, "usual.event.bluetooth.remotedevice.PAIRING_REQ")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_CANCEL, "usual.event.bluetooth.remotedevice.PAIRING_CANCEL")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REQ, "usual.event.bluetooth.remotedevice.CONNECT_REQ")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REPLY, "usual.event.bluetooth.remotedevice.CONNECT_REPLY")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_CANCEL, "usual.event.bluetooth.remotedevice.CONNECT_CANCEL")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_CONNECT_STATE_UPDATE, "usual.event.bluetooth.handsfreeunit.CONNECT_STATE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AUDIO_STATE_UPDATE, "usual.event.bluetooth.handsfreeunit.AUDIO_STATE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_COMMON_EVENT, "usual.event.bluetooth.handsfreeunit.AG_COMMON_EVENT")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_CALL_STATE_UPDATE, "usual.event.bluetooth.handsfreeunit.AG_CALL_STATE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE, "usual.event.bluetooth.host.STATE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE, "usual.event.bluetooth.host.REQ_DISCOVERABLE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE, "usual.event.bluetooth.host.REQ_ENABLE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE, "usual.event.bluetooth.host.REQ_DISABLE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE, "usual.event.bluetooth.host.SCAN_MODE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED, "usual.event.bluetooth.host.DISCOVERY_STARTED")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED, "usual.event.bluetooth.host.DISCOVERY_FINISHED")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE, "usual.event.bluetooth.host.NAME_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_A2DPSINK_CONNECT_STATE_UPDATE, "usual.event.bluetooth.a2dpsink.CONNECT_STATE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_A2DPSINK_PLAYING_STATE_UPDATE, "usual.event.bluetooth.a2dpsink.PLAYING_STATE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BLUETOOTH_A2DPSINK_AUDIO_STATE_UPDATE, "usual.event.bluetooth.a2dpsink.AUDIO_STATE_UPDATE")
        @Expect(CommonEventSupport.COMMON_EVENT_BUNDLE_REMOVED, "usual.event.BUNDLE_REMOVED")
        @Expect(CommonEventSupport.COMMON_EVENT_BOOT_COMPLETED, "usual.event.BOOT_COMPLETED")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_support_value2(): Unit {
        @Expect(CommonEventSupport.COMMON_EVENT_CONNECTIVITY_CHANGE, "usual.event.CONNECTIVITY_CHANGE")
        @Expect(CommonEventSupport.COMMON_EVENT_CALL_STATE_CHANGED, "usual.event.CALL_STATE_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_CHARGE_IDLE_MODE_CHANGED, "usual.event.CHARGE_IDLE_MODE_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_CHARGING, "usual.event.CHARGING")
        @Expect(CommonEventSupport.COMMON_EVENT_CONFIGURATION_CHANGED, "usual.event.CONFIGURATION_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_CLOSE_SYSTEM_DIALOGS, "usual.event.CLOSE_SYSTEM_DIALOGS")
        @Expect(CommonEventSupport.COMMON_EVENT_DISK_EJECT, "usual.event.data.DISK_EJECT")
        @Expect(CommonEventSupport.COMMON_EVENT_DISK_UNMOUNTABLE, "usual.event.data.DISK_UNMOUNTABLE")
        @Expect(CommonEventSupport.COMMON_EVENT_DISK_BAD_REMOVAL, "usual.event.data.DISK_BAD_REMOVAL")
        @Expect(CommonEventSupport.COMMON_EVENT_DISK_MOUNTED, "usual.event.data.DISK_MOUNTED")
        @Expect(CommonEventSupport.COMMON_EVENT_DISK_UNMOUNTED, "usual.event.data.DISK_UNMOUNTED")
        @Expect(CommonEventSupport.COMMON_EVENT_DISK_REMOVED, "usual.event.data.DISK_REMOVED")
        @Expect(CommonEventSupport.COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED, "usual.event.DEVICE_IDLE_MODE_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_DISCHARGING, "usual.event.DISCHARGING")
        @Expect(CommonEventSupport.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOFF, "common.event.DISTRIBUTED_ACCOUNT_LOGOFF")
        @Expect(CommonEventSupport.COMMON_EVENT_DISTRIBUTED_ACCOUNT_TOKEN_INVALID, "common.event.DISTRIBUTED_ACCOUNT_TOKEN_INVALID")
        @Expect(CommonEventSupport.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOUT, "common.event.DISTRIBUTED_ACCOUNT_LOGOUT")
        @Expect(CommonEventSupport.COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGIN, "common.event.DISTRIBUTED_ACCOUNT_LOGIN")
        @Expect(CommonEventSupport.COMMON_EVENT_DRIVE_MODE, "common.event.DRIVE_MODE")
        @Expect(CommonEventSupport.COMMON_EVENT_DATE_CHANGED, "usual.event.DATE_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE, "usual.event.EXTERNAL_APPLICATIONS_UNAVAILABLE")
        @Expect(CommonEventSupport.COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE, "usual.event.EXTERNAL_APPLICATIONS_AVAILABLE")
        @Expect(CommonEventSupport.COMMON_EVENT_FOUNDATION_READY, "common.event.FOUNDATION_READY")
        @Expect(CommonEventSupport.COMMON_EVENT_HOME_MODE, "common.event.HOME_MODE")
        @Expect(CommonEventSupport.COMMON_EVENT_HTTP_PROXY_CHANGE, "usual.event.HTTP_PROXY_CHANGE")
        @Expect(CommonEventSupport.COMMON_EVENT_IVI_SLEEP, "common.event.IVI_SLEEP")
        @Expect(CommonEventSupport.COMMON_EVENT_IVI_PAUSE, "common.event.IVI_PAUSE")
        @Expect(CommonEventSupport.COMMON_EVENT_IVI_STANDBY, "common.event.IVI_STANDBY")
        @Expect(CommonEventSupport.COMMON_EVENT_IVI_LAST_MODE_SAVE, "common.event.IVI_LASTMODE_SAVE")
        @Expect(CommonEventSupport.COMMON_EVENT_IVI_VOLTAGE_ABNORMAL, "common.event.IVI_VOLTAGE_ABNORMAL")
        @Expect(CommonEventSupport.COMMON_EVENT_IVI_HIGH_TEMPERATURE, "common.event.IVI_HIGH_TEMPERATURE")
        @Expect(CommonEventSupport.COMMON_EVENT_IVI_EXTREME_TEMPERATURE, "common.event.IVI_EXTREME_TEMPERATURE")
        @Expect(CommonEventSupport.COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL, "common.event.IVI_TEMPERATURE_ABNORMAL")
        @Expect(CommonEventSupport.COMMON_EVENT_IVI_VOLTAGE_RECOVERY, "common.event.IVI_VOLTAGE_RECOVERY")
        @Expect(CommonEventSupport.COMMON_EVENT_IVI_TEMPERATURE_RECOVERY, "common.event.IVI_TEMPERATURE_RECOVERY")
        @Expect(CommonEventSupport.COMMON_EVENT_IVI_ACTIVE, "common.event.IVI_ACTIVE")
        @Expect(CommonEventSupport.COMMON_EVENT_LOCKED_BOOT_COMPLETED, "usual.event.LOCKED_BOOT_COMPLETED")
        @Expect(CommonEventSupport.COMMON_EVENT_LOCALE_CHANGED, "usual.event.LOCALE_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_LOCATION_MODE_STATE_CHANGED, "usual.event.location.MODE_STATE_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_MY_PACKAGE_REPLACED, "usual.event.MY_PACKAGE_REPLACED")
        @Expect(CommonEventSupport.COMMON_EVENT_MY_PACKAGE_SUSPENDED, "usual.event.MY_PACKAGE_SUSPENDED")
        @Expect(CommonEventSupport.COMMON_EVENT_MY_PACKAGE_UNSUSPENDED, "usual.event.MY_PACKAGE_UNSUSPENDED")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_support_value3(): Unit {
        @Expect(CommonEventSupport.COMMON_EVENT_MANAGE_PACKAGE_STORAGE, "usual.event.MANAGE_PACKAGE_STORAGE")
        @Expect(CommonEventSupport.COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED, "usual.event.nfc.action.ADAPTER_STATE_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED, "usual.event.nfc.action.RF_FIELD_ON_DETECTED")
        @Expect(CommonEventSupport.COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED, "usual.event.nfc.action.RF_FIELD_OFF_DETECTED")
        @Expect(CommonEventSupport.COMMON_EVENT_NETWORK_STATE_CHANGED, "usual.event.NETWORK_STATE_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_OFFICE_MODE, "common.event.OFFICE_MODE")
        @Expect(CommonEventSupport.COMMON_EVENT_POWER_CONNECTED, "usual.event.POWER_CONNECTED")
        @Expect(CommonEventSupport.COMMON_EVENT_POWER_DISCONNECTED, "usual.event.POWER_DISCONNECTED")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGE_ADDED, "usual.event.PACKAGE_ADDED")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGE_REPLACED, "usual.event.PACKAGE_REPLACED")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGE_REMOVED, "usual.event.PACKAGE_REMOVED")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGE_FULLY_REMOVED, "usual.event.PACKAGE_FULLY_REMOVED")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGE_CHANGED, "usual.event.PACKAGE_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGE_RESTARTED, "usual.event.PACKAGE_RESTARTED")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGE_DATA_CLEARED, "usual.event.PACKAGE_DATA_CLEARED")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGE_CACHE_CLEARED, "usual.event.PACKAGE_CACHE_CLEARED")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGES_SUSPENDED, "usual.event.PACKAGES_SUSPENDED")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGES_UNSUSPENDED, "usual.event.PACKAGES_UNSUSPENDED")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGE_FIRST_LAUNCH, "usual.event.PACKAGE_FIRST_LAUNCH")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION, "usual.event.PACKAGE_NEEDS_VERIFICATION")
        @Expect(CommonEventSupport.COMMON_EVENT_PACKAGE_VERIFIED, "usual.event.PACKAGE_VERIFIED")
        @Expect(CommonEventSupport.COMMON_EVENT_POWER_SAVE_MODE_CHANGED, "usual.event.POWER_SAVE_MODE_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_QUICK_FIX_APPLY_RESULT, "usual.event.QUICK_FIX_APPLY_RESULT")
        @Expect(CommonEventSupport.COMMON_EVENT_QUICK_FIX_REVOKE_RESULT, "usual.event.QUICK_FIX_REVOKE_RESULT")
        @Expect(CommonEventSupport.COMMON_EVENT_SHUTDOWN, "usual.event.SHUTDOWN")
        @Expect(CommonEventSupport.COMMON_EVENT_SCREEN_OFF, "usual.event.SCREEN_OFF")
        @Expect(CommonEventSupport.COMMON_EVENT_SCREEN_ON, "usual.event.SCREEN_ON")
        @Expect(CommonEventSupport.COMMON_EVENT_SPLIT_SCREEN, "common.event.SPLIT_SCREEN")
        @Expect(CommonEventSupport.COMMON_EVENT_SLOT_CHANGE, "usual.event.SLOT_CHANGE")
        @Expect(CommonEventSupport.COMMON_EVENT_SPN_INFO_CHANGED, "usual.event.SPN_INFO_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_SIGNAL_INFO_CHANGED, "usual.event.SIGNAL_INFO_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_SIM_STATE_CHANGED, "usual.event.SIM_STATE_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_SCREEN_LOCKED, "usual.event.SCREEN_LOCKED")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_support_value4(): Unit {
        @Expect(CommonEventSupport.COMMON_EVENT_SCREEN_UNLOCKED, "usual.event.SCREEN_UNLOCKED")
        @Expect(CommonEventSupport.COMMON_EVENT_THERMAL_LEVEL_CHANGED, "usual.event.THERMAL_LEVEL_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_TIME_TICK, "usual.event.TIME_TICK")
        @Expect(CommonEventSupport.COMMON_EVENT_TIME_CHANGED, "usual.event.TIME_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_TIMEZONE_CHANGED, "usual.event.TIMEZONE_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_UID_REMOVED, "usual.event.UID_REMOVED")
        @Expect(CommonEventSupport.COMMON_EVENT_USER_STARTED, "usual.event.USER_STARTED")
        @Expect(CommonEventSupport.COMMON_EVENT_USER_BACKGROUND, "usual.event.USER_BACKGROUND")
        @Expect(CommonEventSupport.COMMON_EVENT_USER_FOREGROUND, "usual.event.USER_FOREGROUND")
        @Expect(CommonEventSupport.COMMON_EVENT_USER_SWITCHED, "usual.event.USER_SWITCHED")
        @Expect(CommonEventSupport.COMMON_EVENT_USER_STARTING, "usual.event.USER_STARTING")
        @Expect(CommonEventSupport.COMMON_EVENT_USER_UNLOCKED, "usual.event.USER_UNLOCKED")
        @Expect(CommonEventSupport.COMMON_EVENT_USER_STOPPING, "usual.event.USER_STOPPING")
        @Expect(CommonEventSupport.COMMON_EVENT_USER_STOPPED, "usual.event.USER_STOPPED")
        @Expect(CommonEventSupport.COMMON_EVENT_USER_ADDED, "usual.event.USER_ADDED")
        @Expect(CommonEventSupport.COMMON_EVENT_USER_REMOVED, "usual.event.USER_REMOVED")
        @Expect(CommonEventSupport.COMMON_EVENT_USB_STATE, "usual.event.hardware.usb.action.USB_STATE")
        @Expect(CommonEventSupport.COMMON_EVENT_USB_PORT_CHANGED, "usual.event.hardware.usb.action.USB_PORT_CHANGED")
        @Expect(CommonEventSupport.COMMON_EVENT_USB_DEVICE_ATTACHED, "usual.event.hardware.usb.action.USB_DEVICE_ATTACHED")
        @Expect(CommonEventSupport.COMMON_EVENT_USB_DEVICE_DETACHED, "usual.event.hardware.usb.action.USB_DEVICE_DETACHED")
        @Expect(CommonEventSupport.COMMON_EVENT_USB_ACCESSORY_ATTACHED, "usual.event.hardware.usb.action.USB_ACCESSORY_ATTACHED")
        @Expect(CommonEventSupport.COMMON_EVENT_USB_ACCESSORY_DETACHED, "usual.event.hardware.usb.action.USB_ACCESSORY_DETACHED")
        @Expect(CommonEventSupport.COMMON_EVENT_USER_INFO_UPDATED, "usual.event.USER_INFO_UPDATED")
        @Expect(CommonEventSupport.COMMON_EVENT_VOLUME_REMOVED, "usual.event.data.VOLUME_REMOVED")
        @Expect(CommonEventSupport.COMMON_EVENT_VOLUME_UNMOUNTED, "usual.event.data.VOLUME_UNMOUNTED")
        @Expect(CommonEventSupport.COMMON_EVENT_VOLUME_MOUNTED, "usual.event.data.VOLUME_MOUNTED")
        @Expect(CommonEventSupport.COMMON_EVENT_VOLUME_BAD_REMOVAL, "usual.event.data.VOLUME_BAD_REMOVAL")
        @Expect(CommonEventSupport.COMMON_EVENT_VOLUME_EJECT, "usual.event.data.VOLUME_EJECT")
        @Expect(CommonEventSupport.COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED, "usual.event.data.VISIBLE_ACCOUNTS_UPDATED")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_POWER_STATE, "usual.event.wifi.POWER_STATE")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_SCAN_FINISHED, "usual.event.wifi.SCAN_FINISHED")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_RSSI_VALUE, "usual.event.wifi.RSSI_VALUE")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_CONN_STATE, "usual.event.wifi.CONN_STATE")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_HOTSPOT_STATE, "usual.event.wifi.HOTSPOT_STATE")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_AP_STA_JOIN, "usual.event.wifi.WIFI_HS_STA_JOIN")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_AP_STA_LEAVE, "usual.event.wifi.WIFI_HS_STA_LEAVE")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_MPLINK_STATE_CHANGE, "usual.event.wifi.mplink.STATE_CHANGE")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_P2P_CONN_STATE, "usual.event.wifi.p2p.CONN_STATE_CHANGE")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_P2P_STATE_CHANGED, "usual.event.wifi.p2p.STATE_CHANGE")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_P2P_PEERS_STATE_CHANGED, "usual.event.wifi.p2p.DEVICES_CHANGE")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_P2P_PEERS_DISCOVERY_STATE_CHANGED, "usual.event.wifi.p2p.PEER_DISCOVERY_STATE_CHANGE")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_P2P_CURRENT_DEVICE_STATE_CHANGED, "usual.event.wifi.p2p.CURRENT_DEVICE_CHANGE")
        @Expect(CommonEventSupport.COMMON_EVENT_WIFI_P2P_GROUP_STATE_CHANGED, "usual.event.wifi.p2p.GROUP_STATE_CHANGED")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_common_event_subscribeInfo(): Unit {
        let event = [support1]
        let info = CommonEventSubscribeInfo(
            event,
            publisherPermission: "test_permission",
            publisherDeviceId: "test_id",
            userId: 123,
            priority: -1000,
            publisherBundleName: "test_bundleName"
        )
        @Expect(info.events, event)
        @Expect(info.publisherPermission, "test_permission")
        @Expect(info.publisherDeviceId, "test_id")
        @Expect(info.userId, 123)
        @Expect(info.priority, -100)
        @Expect(info.publisherBundleName, "test_bundleName")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_Construct(): Unit {
        let obj1 = CommonEventManager()
    }
}
