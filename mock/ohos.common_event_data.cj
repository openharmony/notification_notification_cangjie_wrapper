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

package ohos.common_event_data

import ohos.labels.APILevel
import ohos.value_type.CommonEventValueType
import std.collection.HashMap

@!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
public class CommonEventData {
    @!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
    public var event: String

    @!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
    public var bundleName: String

    @!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
    public var code: Int32

    @!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
    public var data: String

    @!APILevel[since: "22", syscap: "SystemCapability.Notification.CommonEvent"]
    public var parameters: HashMap<String, CommonEventValueType>
    
    public init() {
        super()
        this.event = String()
        this.bundleName = String()
        this.code = 0
        this.data = String()
        this.parameters = HashMap<String, CommonEventValueType>()
    }
}