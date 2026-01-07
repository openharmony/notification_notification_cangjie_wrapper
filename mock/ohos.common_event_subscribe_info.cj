/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

package ohos.common_event_subscribe_info

import ohos.labels.APILevel

@!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
public class CommonEventSubscribeInfo {
    @!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
    public var events: Array<String>

    @!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
    public var priority: Int32

    @!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
    public var userId: Int32

    @!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
    public var publisherPermission: String

    @!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
    public var publisherDeviceId: String

    @!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
    public var publisherBundleName: String

    @!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
    public init(
        events: Array<String>,
        publisherPermission!: String = "",
        publisherDeviceId!: String = "",
        userId!: Int32 = -3,
        priority!: Int32 = 0,
        publisherBundleName!: String = ""
    ) {
        super()
        this.events = Array()
        this.priority = 0
        this.userId = 0
        this.publisherPermission = String()
        this.publisherDeviceId = String()
        this.publisherBundleName = String()
    }
}