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

package ohos.events.emitter

import ohos.ffi.{cjArr2CArr, safeMalloc}

const I64_TYPE: Int8 = 0
const BOOL_TYPE: Int8 = 1
const STR_TYPE: Int8 = 2

foreign {
    func FfiOHOSEmitterOnU32Event(id: UInt32, funcId: Int64): Unit
    func FfiOHOSEmitterOnStringEvent(id: CString, funcId: Int64): Unit
    func FfiOHOSEmitterOnceU32Event(id: UInt32, funcId: Int64): Unit
    func FfiOHOSEmitterOnceStringEvent(id: CString, funcId: Int64): Unit
    func FfiOHOSEmitterEmitWithId(id: UInt32, priority: UInt32, data: CEventData): Unit
    func FfiOHOSEmitterEmitWithString(id: CString, priority: UInt32, data: CEventData): Unit
    func FfiOHOSEmitterOffU32Event(id: UInt32): Unit
    func FfiOHOSEmitterOffStringEvent(id: CString): Unit
}

// CEventData should be freed in C.
@C
struct CEventData {
    let parameters: CPointer<CParameter>
    let size: Int64
    init(data: EventData) {
        let params = data.data
        size = params.size
        unsafe {
            if (size == 0) {
                parameters = CPointer<CParameter>()
            } else {
                let constructor = {tuple: (String, EventDataType) => CParameter(tuple[0], tuple[1])}
                parameters = cjArr2CArr<(String, EventDataType), CParameter>(params.toArray(), constructor)
            }
        }
    }
}

unsafe func createPtr<T>(value: T): CPointer<Unit> where T <: CType {
    let ptr = safeMalloc<T>()
    ptr.write(value)
    return CPointer<Unit>(ptr)
}

@C
struct CParameter {
    let valueType: Int8
    let key: CString
    let value: CPointer<Unit>
    init(key: String, value: EventDataType) {
        unsafe {
            this.key = LibC.mallocCString(key)
            try {
                (this.valueType, this.value) = match (value) {
                    case Int64Value(v) => (I64_TYPE, createPtr<Int64>(v))
                    case BoolValue(v) => (BOOL_TYPE, createPtr<Bool>(v))
                    case StringValue(v) => (STR_TYPE, CPointer<Unit>(LibC.mallocCString(v).getChars()))
                    case _ => throw IllegalArgumentException("The type is not supported yet.")
                }
            } catch (e: Exception) {
                LibC.free(this.key)
                throw e
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(key)
            LibC.free(value)
        }
    }
}