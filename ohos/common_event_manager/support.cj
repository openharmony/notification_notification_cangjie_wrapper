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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.common_event_manager

import ohos.labels.APILevel

/**
 * The event type that the commonEvent supported.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Notification.CommonEvent"
]
public class CommonEventSupport {
    /**
     * This commonEvent means when the device is booted or system upgrade completed, and only be sent by system.
     * This API can be called only by system applications.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BOOT_COMPLETED: String = "usual.event.BOOT_COMPLETED"
    /**
     * This commonEvent means when the device finnish booting, but still in the locked state.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_LOCKED_BOOT_COMPLETED: String = "usual.event.LOCKED_BOOT_COMPLETED"
    /**
     * This commonEvent means when the device is shutting down, note: turn off, not sleeping.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_SHUTDOWN: String = "usual.event.SHUTDOWN"
    /**
     * This commonEvent means when the charging state, level and so on about the battery.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BATTERY_CHANGED: String = "usual.event.BATTERY_CHANGED"
    /**
     * This commonEvent means when the device in low battery state.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BATTERY_LOW: String = "usual.event.BATTERY_LOW"
    /**
     * This commonEvent means when the battery level is an ok state.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BATTERY_OKAY: String = "usual.event.BATTERY_OKAY"
    /**
     * This commonEvent means when the other power is connected to the device.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_POWER_CONNECTED: String = "usual.event.POWER_CONNECTED"
    /**
     * This commonEvent means when the other power is removed from the device.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_POWER_DISCONNECTED: String = "usual.event.POWER_DISCONNECTED"
    /**
     * This commonEvent means when the screen is turned off.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_SCREEN_OFF: String = "usual.event.SCREEN_OFF"
    /**
     * This commonEvent means when the device is awakened and interactive.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_SCREEN_ON: String = "usual.event.SCREEN_ON"
    /**
     * This commonEvent means when the thermal state level change.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_THERMAL_LEVEL_CHANGED: String = "usual.event.THERMAL_LEVEL_CHANGED"
    /**
     * This commonEvent means when the current time is changed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_TIME_TICK: String = "usual.event.TIME_TICK"
    /**
     * This commonEvent means when the time is set.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_TIME_CHANGED: String = "usual.event.TIME_CHANGED"
    /**
     * This commonEvent means when the current date is changed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DATE_CHANGED: String = "usual.event.DATE_CHANGED"
    /**
     * This commonEvent means when the time zone is changed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_TIMEZONE_CHANGED: String = "usual.event.TIMEZONE_CHANGED"
    /**
     * This commonEvent means when the dialog to dismiss.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_CLOSE_SYSTEM_DIALOGS: String = "usual.event.CLOSE_SYSTEM_DIALOGS"
    /**
     * This commonEvent means when a new application package is installed on the device.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGE_ADDED: String = "usual.event.PACKAGE_ADDED"
    /**
     * This commonEvent means when a new version application package is installed on the device and
     * replace the old version.the data contains the name of the package.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGE_REPLACED: String = "usual.event.PACKAGE_REPLACED"
    /**
     * This commonEvent means when a new version application package is installed on the device and
     * replace the old version, it does not contain additional data and only be sent to the replaced application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_MY_PACKAGE_REPLACED: String = "usual.event.MY_PACKAGE_REPLACED"
    /**
     * This commonEvent means when an existing application package is removed from the device.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGE_REMOVED: String = "usual.event.PACKAGE_REMOVED"
    /**
     * This commonEvent means when an existing application package is removed from the device.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BUNDLE_REMOVED: String = "usual.event.BUNDLE_REMOVED"
    /**
     * This commonEvent means when an existing application package is completely removed from the device.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGE_FULLY_REMOVED: String = "usual.event.PACKAGE_FULLY_REMOVED"
    /**
     * This commonEvent means when an existing application package has been changed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGE_CHANGED: String = "usual.event.PACKAGE_CHANGED"
    /**
     * This commonEvent means the user has restarted a package, and all of its processes have been killed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGE_RESTARTED: String = "usual.event.PACKAGE_RESTARTED"
    /**
     * This commonEvent means the user has cleared the package data.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGE_DATA_CLEARED: String = "usual.event.PACKAGE_DATA_CLEARED"
    /**
     * This commonEvent means the user has cleared the package cache.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGE_CACHE_CLEARED: String = "usual.event.PACKAGE_CACHE_CLEARED"
    /**
     * This commonEvent means the packages have been suspended.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGES_SUSPENDED: String = "usual.event.PACKAGES_SUSPENDED"
    /**
     * This commonEvent means the packages have been un-suspended.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGES_UNSUSPENDED: String = "usual.event.PACKAGES_UNSUSPENDED"
    /**
     * This commonEvent Sent to a package that has been suspended by the system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_MY_PACKAGE_SUSPENDED: String = "usual.event.MY_PACKAGE_SUSPENDED"
    /**
     * Sent to a package that has been un-suspended.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_MY_PACKAGE_UNSUSPENDED: String = "usual.event.MY_PACKAGE_UNSUSPENDED"
    /**
     * A user id has been removed from the system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_UID_REMOVED: String = "usual.event.UID_REMOVED"
    /**
     * The application is first launched after installed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGE_FIRST_LAUNCH: String = "usual.event.PACKAGE_FIRST_LAUNCH"
    /**
     * Sent by system package verifier when a package need to be verified.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION: String = "usual.event.PACKAGE_NEEDS_VERIFICATION"
    /**
     * Sent by system package verifier when a package is verified.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_PACKAGE_VERIFIED: String = "usual.event.PACKAGE_VERIFIED"
    /**
     * Resources for a set of packages (which were previously unavailable) are currently
     * available since the media on which they exist is available.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE: String = "usual.event.EXTERNAL_APPLICATIONS_AVAILABLE"
    /**
     * Resources for a set of packages are currently unavailable since the media on which they exist is unavailable.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE: String = "usual.event.EXTERNAL_APPLICATIONS_UNAVAILABLE"
    /**
     * The device configuration such as orientation,locale have been changed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_CONFIGURATION_CHANGED: String = "usual.event.CONFIGURATION_CHANGED"
    /**
     * The current device's locale has changed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_LOCALE_CHANGED: String = "usual.event.LOCALE_CHANGED"
    /**
     * Indicates low memory condition notification acknowledged by user and package management should be started.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_MANAGE_PACKAGE_STORAGE: String = "usual.event.MANAGE_PACKAGE_STORAGE"
    /**
     * Send by the smart function when the system in drive mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DRIVE_MODE: String = "common.event.DRIVE_MODE"
    /**
     * Send by the smart function when the system in home mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_HOME_MODE: String = "common.event.HOME_MODE"
    /**
     * Send by the smart function when the system in office mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_OFFICE_MODE: String = "common.event.OFFICE_MODE"
    /**
     * Remind new user of preparing to start.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USER_STARTED: String = "usual.event.USER_STARTED"
    /**
     * Remind previous user of that the service has been the background.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USER_BACKGROUND: String = "usual.event.USER_BACKGROUND"
    /**
     * Remind new user of that the service has been the foreground.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USER_FOREGROUND: String = "usual.event.USER_FOREGROUND"
    /**
     * Remind new user of that the service has been switched to new user.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USER_SWITCHED: String = "usual.event.USER_SWITCHED"
    /**
     * Remind new user of that the service has been starting.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USER_STARTING: String = "usual.event.USER_STARTING"
    /**
     * Remind new user of that the service has been unlocked.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USER_UNLOCKED: String = "usual.event.USER_UNLOCKED"
    /**
     * Remind new user of that the service has been stopping.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USER_STOPPING: String = "usual.event.USER_STOPPING"
    /**
     * Remind new user of that the service has stopped.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USER_STOPPED: String = "usual.event.USER_STOPPED"
    /**
     * Distributed account login successfully.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGIN: String = "common.event.DISTRIBUTED_ACCOUNT_LOGIN"
    /**
     * Distributed account logout successfully.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOUT: String = "common.event.DISTRIBUTED_ACCOUNT_LOGOUT"
    /**
     * Distributed account is invalid.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_TOKEN_INVALID: String = "common.event.DISTRIBUTED_ACCOUNT_TOKEN_INVALID"
    /**
     * Distributed account logs off.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOFF: String = "common.event.DISTRIBUTED_ACCOUNT_LOGOFF"
    /**
     * WIFI state.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_POWER_STATE: String = "usual.event.wifi.POWER_STATE"
    /**
     * WIFI scan results.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_SCAN_FINISHED: String = "usual.event.wifi.SCAN_FINISHED"
    /**
     * WIFI RSSI change.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_RSSI_VALUE: String = "usual.event.wifi.RSSI_VALUE"
    /**
     * WIFI connect state.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_CONN_STATE: String = "usual.event.wifi.CONN_STATE"
    /**
     * WIFI hotspot state.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_HOTSPOT_STATE: String = "usual.event.wifi.HOTSPOT_STATE"
    /**
     * WIFI ap sta join.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_AP_STA_JOIN: String = "usual.event.wifi.WIFI_HS_STA_JOIN"
    /**
     * WIFI ap sta join.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_AP_STA_LEAVE: String = "usual.event.wifi.WIFI_HS_STA_LEAVE"
    /**
     * Indicates Wi-Fi MpLink state notification acknowledged by binding or unbinding MpLink.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_MPLINK_STATE_CHANGE: String = "usual.event.wifi.mplink.STATE_CHANGE"
    /**
     * Indicates Wi-Fi P2P connection state notification acknowledged by connecting or disconnected P2P.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_P2P_CONN_STATE: String = "usual.event.wifi.p2p.CONN_STATE_CHANGE"
    /**
     * Indicates that the Wi-Fi P2P state change.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_P2P_STATE_CHANGED: String = "usual.event.wifi.p2p.STATE_CHANGE"
    /**
     * Indicates that the Wi-Fi P2P peers state change.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_P2P_PEERS_STATE_CHANGED: String = "usual.event.wifi.p2p.DEVICES_CHANGE"
    /**
     * Indicates that the Wi-Fi P2P discovery state change.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_P2P_PEERS_DISCOVERY_STATE_CHANGED: String = "usual.event.wifi.p2p.PEER_DISCOVERY_STATE_CHANGE"
    /**
     * Indicates that the Wi-Fi P2P current device state change.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_P2P_CURRENT_DEVICE_STATE_CHANGED: String = "usual.event.wifi.p2p.CURRENT_DEVICE_CHANGE"
    /**
     * Indicates that the Wi-Fi P2P group info is changed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_WIFI_P2P_GROUP_STATE_CHANGED: String = "usual.event.wifi.p2p.GROUP_STATE_CHANGED"
    /**
     * Bluetooth.handsfree.ag.connect.state.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.handsfree.ag.CONNECT_STATE_UPDATE"
    /**
     * Bluetooth.handsfree.ag.current.device.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CURRENT_DEVICE_UPDATE: String = "usual.event.bluetooth.handsfree.ag.CURRENT_DEVICE_UPDATE"
    /**
     * Bluetooth.handsfree.ag.audio.state.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_AUDIO_STATE_UPDATE: String = "usual.event.bluetooth.handsfree.ag.AUDIO_STATE_UPDATE"
    /**
     * Bluetooth.a2dpsource.connect.state.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsource.CONNECT_STATE_UPDATE"
    /**
     * Bluetooth.a2dpsource.current.device.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CURRENT_DEVICE_UPDATE: String = "usual.event.bluetooth.a2dpsource.CURRENT_DEVICE_UPDATE"
    /**
     * Bluetooth.a2dpsource.playing.state.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_PLAYING_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsource.PLAYING_STATE_UPDATE"
    /**
     * Bluetooth.a2dpsource.avrcp.connect.state.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsource.AVRCP_CONNECT_STATE_UPDATE"
    /**
     * Bluetooth.a2dpsource.codec.value.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_UPDATE: String = "usual.event.bluetooth.a2dpsource.CODEC_VALUE_UPDATE"
    /**
     * Bluetooth.remotedevice.discovered.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_DISCOVERED: String = "usual.event.bluetooth.remotedevice.DISCOVERED"
    /**
     * Bluetooth.remotedevice.class.value.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CLASS_VALUE_UPDATE: String = "usual.event.bluetooth.remotedevice.CLASS_VALUE_UPDATE"
    /**
     * Bluetooth.remotedevice.acl.connected.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_CONNECTED: String = "usual.event.bluetooth.remotedevice.ACL_CONNECTED"
    /**
     * Bluetooth.remotedevice.acl.disconnected.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_DISCONNECTED: String = "usual.event.bluetooth.remotedevice.ACL_DISCONNECTED"
    /**
     * Bluetooth.remotedevice.name.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_NAME_UPDATE: String = "usual.event.bluetooth.remotedevice.NAME_UPDATE"
    /**
     * Bluetooth.remotedevice.pair.state.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE: String = "usual.event.bluetooth.remotedevice.PAIR_STATE"
    /**
     * Bluetooth.remotedevice.battery.value.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_BATTERY_VALUE_UPDATE: String = "usual.event.bluetooth.remotedevice.BATTERY_VALUE_UPDATE"
    /**
     * Bluetooth.remotedevice.sdp.result.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_SDP_RESULT: String = "usual.event.bluetooth.remotedevice.SDP_RESULT"
    /**
     * Bluetooth.remotedevice.uuid.value.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_UUID_VALUE: String = "usual.event.bluetooth.remotedevice.UUID_VALUE"
    /**
     * Bluetooth.remotedevice.pairing.req.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_REQ: String = "usual.event.bluetooth.remotedevice.PAIRING_REQ"
    /**
     * Bluetooth.remotedevice.pairing.cancel.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_CANCEL: String = "usual.event.bluetooth.remotedevice.PAIRING_CANCEL"
    /**
     * Bluetooth.remotedevice.connect.req.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REQ: String = "usual.event.bluetooth.remotedevice.CONNECT_REQ"
    /**
     * Bluetooth.remotedevice.connect.reply.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REPLY: String = "usual.event.bluetooth.remotedevice.CONNECT_REPLY"
    /**
     * Bluetooth.remotedevice.connect.cancel.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_CANCEL: String = "usual.event.bluetooth.remotedevice.CONNECT_CANCEL"
    /**
     * Bluetooth.handsfreeunit.connect.state.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.handsfreeunit.CONNECT_STATE_UPDATE"
    /**
     * Bluetooth.handsfreeunit.audio.state.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AUDIO_STATE_UPDATE: String = "usual.event.bluetooth.handsfreeunit.AUDIO_STATE_UPDATE"
    /**
     * Bluetooth.handsfreeunit.ag.common.event.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_COMMON_EVENT: String = "usual.event.bluetooth.handsfreeunit.AG_COMMON_EVENT"
    /**
     * Bluetooth.handsfreeunit.ag.call.state.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_CALL_STATE_UPDATE: String = "usual.event.bluetooth.handsfreeunit.AG_CALL_STATE_UPDATE"
    /**
     * Bluetooth.host.state.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE: String = "usual.event.bluetooth.host.STATE_UPDATE"
    /**
     * Bluetooth.host.req.discoverable.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE: String = "usual.event.bluetooth.host.REQ_DISCOVERABLE"
    /**
     * Bluetooth.host.req.enable.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE: String = "usual.event.bluetooth.host.REQ_ENABLE"
    /**
     * Bluetooth.host.req.disable.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE: String = "usual.event.bluetooth.host.REQ_DISABLE"
    /**
     * Bluetooth.host.scan.mode.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE: String = "usual.event.bluetooth.host.SCAN_MODE_UPDATE"
    /**
     * Bluetooth.host.discovery.started.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED: String = "usual.event.bluetooth.host.DISCOVERY_STARTED"
    /**
     * Bluetooth.host.discovery.finished.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED: String = "usual.event.bluetooth.host.DISCOVERY_FINISHED"
    /**
     * Bluetooth.host.name.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE: String = "usual.event.bluetooth.host.NAME_UPDATE"
    /**
     * Bluetooth.a2dp.connect.state.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_A2DPSINK_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsink.CONNECT_STATE_UPDATE"
    /**
     * Bluetooth.a2dp.playing.state.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_A2DPSINK_PLAYING_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsink.PLAYING_STATE_UPDATE"
    /**
     * Bluetooth.a2dp.audio.state.update.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_BLUETOOTH_A2DPSINK_AUDIO_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsink.AUDIO_STATE_UPDATE"
    /**
     * Nfc state change.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED: String = "usual.event.nfc.action.ADAPTER_STATE_CHANGED"
    /**
     * Nfc field on detected.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED: String = "usual.event.nfc.action.RF_FIELD_ON_DETECTED"
    /**
     * Nfc field off detected.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED: String = "usual.event.nfc.action.RF_FIELD_OFF_DETECTED"
    /**
     * Sent when stop charging battery.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DISCHARGING: String = "usual.event.DISCHARGING"
    /**
     * Sent when start charging battery.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_CHARGING: String = "usual.event.CHARGING"
    /**
     * Sent when device's idle mode changed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED: String = "usual.event.DEVICE_IDLE_MODE_CHANGED"
    /**
     * Sent when device's charge idle mode changed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_CHARGE_IDLE_MODE_CHANGED: String = "usual.event.CHARGE_IDLE_MODE_CHANGED"
    /**
     * Sent when device's power save mode changed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_POWER_SAVE_MODE_CHANGED: String = "usual.event.POWER_SAVE_MODE_CHANGED"
    /**
     * User added.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USER_ADDED: String = "usual.event.USER_ADDED"
    /**
     * User removed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USER_REMOVED: String = "usual.event.USER_REMOVED"
    /**
     * Sent when ability is added.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_ABILITY_ADDED: String = "common.event.ABILITY_ADDED"
    /**
     * Sent when ability is removed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_ABILITY_REMOVED: String = "common.event.ABILITY_REMOVED"
    /**
     * Sent when ability is updated.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_ABILITY_UPDATED: String = "common.event.ABILITY_UPDATED"
    /**
     * Gps mode state changed.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_LOCATION_MODE_STATE_CHANGED: String = "usual.event.location.MODE_STATE_CHANGED"
    /**
     * The ivi is about to go into sleep state when the ivi is turned off power.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_IVI_SLEEP: String = "common.event.IVI_SLEEP"
    /**
     * The ivi is slept and notify the app stop playing.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_IVI_PAUSE: String = "common.event.IVI_PAUSE"
    /**
     * The ivi is standby and notify the app stop playing.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_IVI_STANDBY: String = "common.event.IVI_STANDBY"
    /**
     * The app stop playing and save state.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_IVI_LAST_MODE_SAVE: String = "common.event.IVI_LASTMODE_SAVE"
    /**
     * The ivi is voltage abnormal.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_IVI_VOLTAGE_ABNORMAL: String = "common.event.IVI_VOLTAGE_ABNORMAL"
    /**
     * The ivi temperature is too high.
     * This is a protected common event that can only be sent by system.this common event will be delete later,
     * please use COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_IVI_HIGH_TEMPERATURE: String = "common.event.IVI_HIGH_TEMPERATURE"
    /**
     * The ivi temperature is extreme high.
     * This is a protected common event that can only be sent by system.this common event will be delete later,
     * please use COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_IVI_EXTREME_TEMPERATURE: String = "common.event.IVI_EXTREME_TEMPERATURE"
    /**
     * The ivi temperature is abnormal.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL: String = "common.event.IVI_TEMPERATURE_ABNORMAL"
    /**
     * The ivi voltage is recovery.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_IVI_VOLTAGE_RECOVERY: String = "common.event.IVI_VOLTAGE_RECOVERY"
    /**
     * The ivi temperature is recovery.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_IVI_TEMPERATURE_RECOVERY: String = "common.event.IVI_TEMPERATURE_RECOVERY"
    /**
     * The battery service is active.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_IVI_ACTIVE: String = "common.event.IVI_ACTIVE"
    /**
     * The usb state change events.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USB_STATE: String = "usual.event.hardware.usb.action.USB_STATE"
    /**
     * The usb port changed.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USB_PORT_CHANGED: String = "usual.event.hardware.usb.action.USB_PORT_CHANGED"
    /**
     * The usb device attached.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USB_DEVICE_ATTACHED: String = "usual.event.hardware.usb.action.USB_DEVICE_ATTACHED"
    /**
     * The usb device detached.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USB_DEVICE_DETACHED: String = "usual.event.hardware.usb.action.USB_DEVICE_DETACHED"
    /**
     * The usb accessory attached.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USB_ACCESSORY_ATTACHED: String = "usual.event.hardware.usb.action.USB_ACCESSORY_ATTACHED"
    /**
     * The usb accessory detached.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USB_ACCESSORY_DETACHED: String = "usual.event.hardware.usb.action.USB_ACCESSORY_DETACHED"
    /**
     * The external storage was removed.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DISK_REMOVED: String = "usual.event.data.DISK_REMOVED"
    /**
     * The external storage was unmounted.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DISK_UNMOUNTED: String = "usual.event.data.DISK_UNMOUNTED"
    /**
     * The external storage was mounted.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DISK_MOUNTED: String = "usual.event.data.DISK_MOUNTED"
    /**
     * The external storage was bad removal.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DISK_BAD_REMOVAL: String = "usual.event.data.DISK_BAD_REMOVAL"
    /**
     * The external storage was unmountable.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DISK_UNMOUNTABLE: String = "usual.event.data.DISK_UNMOUNTABLE"
    /**
     * The external storage was eject.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_DISK_EJECT: String = "usual.event.data.DISK_EJECT"
    /**
     * The external storage was removed.
     * This is a protected common event that can only be sent by system.
     * This API can be called only by system applications.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_VOLUME_REMOVED: String = "usual.event.data.VOLUME_REMOVED"
    /**
     * The external storage was unmounted.
     * This is a protected common event that can only be sent by system.
     * This API can be called only by system applications.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_VOLUME_UNMOUNTED: String = "usual.event.data.VOLUME_UNMOUNTED"
    /**
     * The external storage was mounted.
     * This is a protected common event that can only be sent by system.
     * This API can be called only by system applications.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_VOLUME_MOUNTED: String = "usual.event.data.VOLUME_MOUNTED"
    /**
     * The external storage was bad removal.
     * This is a protected common event that can only be sent by system.
     * This API can be called only by system applications.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_VOLUME_BAD_REMOVAL: String = "usual.event.data.VOLUME_BAD_REMOVAL"
    /**
     * The external storage was eject.
     * This is a protected common event that can only be sent by system.
     * This API can be called only by system applications.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_VOLUME_EJECT: String = "usual.event.data.VOLUME_EJECT"
    /**
     * The visible of account was updated.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED: String = "usual.event.data.VISIBLE_ACCOUNTS_UPDATED"
    /**
     * Account was deleted.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_ACCOUNT_DELETED: String = "usual.event.data.ACCOUNT_DELETED"
    /**
     * Foundation was ready.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_FOUNDATION_READY: String = "common.event.FOUNDATION_READY"
    /**
     * Indicates the common event Action indicating that the airplane mode status of the device changes.
     * Users can register this event to listen to the change of the airplane mode status of the device.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_AIRPLANE_MODE_CHANGED: String = "usual.event.AIRPLANE_MODE"
    /**
     * sent by the window manager service when the window mode is split.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_SPLIT_SCREEN: String = "common.event.SPLIT_SCREEN"
    /**
     * The notification slot has been updated.
     * This is a protected common event that can only be sent by system.
     * This API can be called only by system applications.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_SLOT_CHANGE: String = "usual.event.SLOT_CHANGE"
    /**
     * Indicate the action of a common event that the spn display information has been updated.
     * This common event can be triggered only by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_SPN_INFO_CHANGED: String = "usual.event.SPN_INFO_CHANGED"
    /**
     * Indicate the result of quick fix apply.
     * This common event can be triggered only by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_QUICK_FIX_APPLY_RESULT: String = "usual.event.QUICK_FIX_APPLY_RESULT"
    /**
     * Indicate the result of quick fix revoke.
     * This common event can be triggered only by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_QUICK_FIX_REVOKE_RESULT: String = "usual.event.QUICK_FIX_REVOKE_RESULT"
    /**
     * Indicate the action of a common event that the user information has been updated.
     * This common event can be triggered only by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_USER_INFO_UPDATED: String = "usual.event.USER_INFO_UPDATED"
    /**
     * Indicate http proxy has been changed.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_HTTP_PROXY_CHANGE: String = "usual.event.HTTP_PROXY_CHANGE"
    /**
     * Indicates the action of a common event that the phone SIM card state has changed.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_SIM_STATE_CHANGED: String = "usual.event.SIM_STATE_CHANGED"
    /**
     * Indicates the action of a common event that the call state has been changed.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_CALL_STATE_CHANGED: String = "usual.event.CALL_STATE_CHANGED"
    /**
     * Indicates the action of a common event that the network state has been changed.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_NETWORK_STATE_CHANGED: String = "usual.event.NETWORK_STATE_CHANGED"
    /**
     * Indicates the action of a common event that the signal info has been changed.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_SIGNAL_INFO_CHANGED: String = "usual.event.SIGNAL_INFO_CHANGED"
    /**
     * This commonEvent means when the screen is unlocked.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_SCREEN_UNLOCKED: String = "usual.event.SCREEN_UNLOCKED"
    /**
     * This commonEvent means when the screen is locked.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_SCREEN_LOCKED: String = "usual.event.SCREEN_LOCKED"
    /**
     * Indicates the action of a common event that the network connectivity changed.
     * This is a protected common event that can only be sent by system.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static const COMMON_EVENT_CONNECTIVITY_CHANGE: String = "usual.event.CONNECTIVITY_CHANGE"
}
