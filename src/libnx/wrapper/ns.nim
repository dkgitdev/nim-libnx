import strutils
import ospaths
const headerns = currentSourcePath().splitPath().head & "/nx/include/switch/services/ns.h"
import libnx/wrapper/types
import libnx/wrapper/nacp
import libnx/wrapper/fs
type
  NsApplicationControlData* {.importc: "NsApplicationControlData",
                             header: headerns, bycopy.} = object
    nacp* {.importc: "nacp".}: NacpStruct
    icon* {.importc: "icon".}: array[0x00020000, uint8]


proc nsInitialize*(): Result {.cdecl, importc: "nsInitialize", header: headerns.}
proc nsExit*() {.cdecl, importc: "nsExit", header: headerns.}
proc nsGetApplicationControlData*(flag: uint8; titleID: uint64;
                                 buffer: ptr NsApplicationControlData; size: csize;
                                 actual_size: ptr csize): Result {.cdecl,
    importc: "nsGetApplicationControlData", header: headerns.}
proc nsGetTotalSpaceSize*(storage_id: FsStorageId; size: ptr uint64): Result {.cdecl,
    importc: "nsGetTotalSpaceSize", header: headerns.}
proc nsGetFreeSpaceSize*(storage_id: FsStorageId; size: ptr uint64): Result {.cdecl,
    importc: "nsGetFreeSpaceSize", header: headerns.}
proc nsvmInitialize*(): Result {.cdecl, importc: "nsvmInitialize", header: headerns.}
proc nsvmExit*() {.cdecl, importc: "nsvmExit", header: headerns.}
proc nsvmNeedsUpdateVulnerability*(`out`: ptr bool): Result {.cdecl,
    importc: "nsvmNeedsUpdateVulnerability", header: headerns.}
proc nsvmGetSafeSystemVersion*(`out`: ptr uint16): Result {.cdecl,
    importc: "nsvmGetSafeSystemVersion", header: headerns.}
proc nsdevInitialize*(): Result {.cdecl, importc: "nsdevInitialize",
                               header: headerns.}
proc nsdevExit*() {.cdecl, importc: "nsdevExit", header: headerns.}
proc nsdevTerminateProcess*(pid: uint64): Result {.cdecl,
    importc: "nsdevTerminateProcess", header: headerns.}
proc nsdevTerminateProgram*(tid: uint64): Result {.cdecl,
    importc: "nsdevTerminateProgram", header: headerns.}