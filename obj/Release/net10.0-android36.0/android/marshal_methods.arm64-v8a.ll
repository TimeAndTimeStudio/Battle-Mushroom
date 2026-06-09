; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [23 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [69 x i64] [
	i64 u0x02abedc11addc1ed, ; 0: lib_Mono.Android.Runtime.dll.so => 21
	i64 u0x0581db89237110e9, ; 1: lib_System.Collections.dll.so => 6
	i64 u0x0c59ad9fbbd43abe, ; 2: Mono.Android => 22
	i64 u0x13f1e5e209e91af4, ; 3: lib_Java.Interop.dll.so => 20
	i64 u0x1a91866a319e9259, ; 4: lib_System.Collections.Concurrent.dll.so => 5
	i64 u0x1c753b5ff15bce1b, ; 5: Mono.Android.Runtime.dll => 21
	i64 u0x1d97f3d80b169071, ; 6: th-TH/BattleMushroom.resources.dll => 0
	i64 u0x2174319c0d835bc9, ; 7: System.Runtime => 17
	i64 u0x23207e2dca5ba6f3, ; 8: lib_BattleMushroom.dll.so => 4
	i64 u0x2407aef2bbe8fadf, ; 9: System.Console => 9
	i64 u0x240abe014b27e7d3, ; 10: Xamarin.AndroidX.Core.dll => 3
	i64 u0x247619fe4413f8bf, ; 11: System.Runtime.Serialization.Primitives.dll => 16
	i64 u0x27b410442fad6cf1, ; 12: Java.Interop.dll => 20
	i64 u0x2af298f63581d886, ; 13: System.Text.RegularExpressions.dll => 18
	i64 u0x31195fef5d8fb552, ; 14: _Microsoft.Android.Resource.Designer.dll => 1
	i64 u0x3235427f8d12dae1, ; 15: lib_System.Drawing.Primitives.dll.so => 10
	i64 u0x3d9c2a242b040a50, ; 16: lib_Xamarin.AndroidX.Core.dll.so => 3
	i64 u0x434c4e1d9284cdae, ; 17: Mono.Android.dll => 22
	i64 u0x4499fa3c8e494654, ; 18: lib_System.Runtime.Serialization.Primitives.dll.so => 16
	i64 u0x490cffb50a3cc73e, ; 19: MonoGame.Framework => 2
	i64 u0x49e952f19a4e2022, ; 20: System.ObjectModel => 13
	i64 u0x4e32f00cb0937401, ; 21: Mono.Android.Runtime => 21
	i64 u0x51bb8a2afe774e32, ; 22: System.Drawing => 11
	i64 u0x529ffe06f39ab8db, ; 23: Xamarin.AndroidX.Core => 3
	i64 u0x54795225dd1587af, ; 24: lib_System.Runtime.dll.so => 17
	i64 u0x571c5cfbec5ae8e2, ; 25: System.Private.Uri => 14
	i64 u0x579a06fed6eec900, ; 26: System.Private.CoreLib.dll => 19
	i64 u0x5ae9cd33b15841bf, ; 27: System.ComponentModel => 8
	i64 u0x5db0cbbd1028510e, ; 28: lib_System.Runtime.InteropServices.dll.so => 15
	i64 u0x622eef6f9e59068d, ; 29: System.Private.CoreLib => 19
	i64 u0x6692e924eade1b29, ; 30: lib_System.Console.dll.so => 9
	i64 u0x6872ec7a2e36b1ac, ; 31: System.Drawing.Primitives.dll => 10
	i64 u0x6a4d7577b2317255, ; 32: System.Runtime.InteropServices.dll => 15
	i64 u0x7bef86a4335c4870, ; 33: System.ComponentModel.TypeConverter => 7
	i64 u0x7dfc3d6d9d8d7b70, ; 34: System.Collections => 6
	i64 u0x7e946809d6008ef2, ; 35: lib_System.ObjectModel.dll.so => 13
	i64 u0x7ecc13347c8fd849, ; 36: lib_System.ComponentModel.dll.so => 8
	i64 u0x82df8f5532a10c59, ; 37: lib_System.Drawing.dll.so => 11
	i64 u0x8da188285aadfe8e, ; 38: System.Collections.Concurrent => 5
	i64 u0x903101b46fb73a04, ; 39: _Microsoft.Android.Resource.Designer => 1
	i64 u0x90da922f4ccbc487, ; 40: lib_MonoGame.Framework.dll.so => 2
	i64 u0x91a74f07b30d37e2, ; 41: System.Linq.dll => 12
	i64 u0x97b8c771ea3e4220, ; 42: System.ComponentModel.dll => 8
	i64 u0x97e144c9d3c6976e, ; 43: System.Collections.Concurrent.dll => 5
	i64 u0xa0ff68ed7028ffb3, ; 44: BattleMushroom.dll => 4
	i64 u0xa471ec8eb33f2a80, ; 45: BattleMushroom => 4
	i64 u0xadc90ab061a9e6e4, ; 46: System.ComponentModel.TypeConverter.dll => 7
	i64 u0xae282bcd03739de7, ; 47: Java.Interop => 20
	i64 u0xae53579c90db1107, ; 48: System.ObjectModel.dll => 13
	i64 u0xb220631954820169, ; 49: System.Text.RegularExpressions => 18
	i64 u0xb7212c4683a94afe, ; 50: System.Drawing.Primitives => 10
	i64 u0xb81a2c6e0aee50fe, ; 51: lib_System.Private.CoreLib.dll.so => 19
	i64 u0xba48785529705af9, ; 52: System.Collections.dll => 6
	i64 u0xc0d928351ab5ca77, ; 53: System.Console.dll => 9
	i64 u0xc12b8b3afa48329c, ; 54: lib_System.Linq.dll.so => 12
	i64 u0xc50fded0ded1418c, ; 55: lib_System.ComponentModel.TypeConverter.dll.so => 7
	i64 u0xc5a0f4b95a699af7, ; 56: lib_System.Private.Uri.dll.so => 14
	i64 u0xcbd4fdd9cef4a294, ; 57: lib__Microsoft.Android.Resource.Designer.dll.so => 1
	i64 u0xcc2876b32ef2794c, ; 58: lib_System.Text.RegularExpressions.dll.so => 18
	i64 u0xcc667334debe5bbf, ; 59: MonoGame.Framework.dll => 2
	i64 u0xd333d0af9e423810, ; 60: System.Runtime.InteropServices => 15
	i64 u0xd3651b6fc3125825, ; 61: System.Private.Uri.dll => 14
	i64 u0xdb8ea4c4546de2e1, ; 62: lib-th-TH-BattleMushroom.resources.dll.so => 0
	i64 u0xdbf9607a441b4505, ; 63: System.Linq => 12
	i64 u0xdd2b722d78ef5f43, ; 64: System.Runtime.dll => 17
	i64 u0xe4f74a0b5bf9703f, ; 65: System.Runtime.Serialization.Primitives => 16
	i64 u0xe5434e8a119ceb69, ; 66: lib_Mono.Android.dll.so => 22
	i64 u0xe89a2a9ef110899b, ; 67: System.Drawing.dll => 11
	i64 u0xfcb15de8aa7b83d7 ; 68: th-TH/BattleMushroom.resources => 0
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [69 x i32] [
	i32 21, i32 6, i32 22, i32 20, i32 5, i32 21, i32 0, i32 17,
	i32 4, i32 9, i32 3, i32 16, i32 20, i32 18, i32 1, i32 10,
	i32 3, i32 22, i32 16, i32 2, i32 13, i32 21, i32 11, i32 3,
	i32 17, i32 14, i32 19, i32 8, i32 15, i32 19, i32 9, i32 10,
	i32 15, i32 7, i32 6, i32 13, i32 8, i32 11, i32 5, i32 1,
	i32 2, i32 12, i32 8, i32 5, i32 4, i32 4, i32 7, i32 20,
	i32 13, i32 18, i32 10, i32 19, i32 6, i32 9, i32 12, i32 7,
	i32 14, i32 1, i32 18, i32 2, i32 15, i32 14, i32 0, i32 12,
	i32 17, i32 16, i32 22, i32 11, i32 0
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 13, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [13 x %struct.MarshalMethodsManagedClass] [
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000082, ; class name: Android.Media.MediaPlayer/IOnCompletionListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 0
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000126, ; class name: Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 1
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200013d, ; class name: Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 2
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000129, ; class name: Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 3
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200014d, ; class name: Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 4
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200011a, ; class name: Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 5
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200008d, ; class name: Android.Views.View, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 6
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200009f, ; class name: Android.Views.ISurfaceHolderCallbackInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 7
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200008f, ; class name: Android.Views.View/IOnTouchListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 8
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000b1, ; class name: Android.Views.OrientationEventListener, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 9
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000106, ; class name: Android.Content.BroadcastReceiver, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 10
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000015, ; class name: AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 11
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000165, ; class name: Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	} ; 12
], align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [13 x ptr] [
	ptr @.mm.0, ; 0 ('Android.Media.MediaPlayer/IOnCompletionListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.1, ; 1 ('Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.2, ; 2 ('Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.3, ; 3 ('Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.4, ; 4 ('Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.5, ; 5 ('Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.6, ; 6 ('Android.Views.View, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.7, ; 7 ('Android.Views.ISurfaceHolderCallbackInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.8, ; 8 ('Android.Views.View/IOnTouchListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.9, ; 9 ('Android.Views.OrientationEventListener, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.10, ; 10 ('Android.Content.BroadcastReceiver, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.11, ; 11 ('AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.12 ; 12 ('Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
], align 8

@mm_method_names = dso_local local_unnamed_addr constant [31 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x00000016060002de, ; name: n_OnCompletion_Landroid_media_MediaPlayer__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.0_name; char* name
	}, ; 0
	%struct.MarshalMethodName {
		i64 u0x0000001606000937, ; name: n_Close_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.1_name; char* name
	}, ; 1
	%struct.MarshalMethodName {
		i64 u0x0000001606000938, ; name: n_Read_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.2_name; char* name
	}, ; 2
	%struct.MarshalMethodName {
		i64 u0x0000001606000939, ; name: n_Read_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.3_name; char* name
	}, ; 3
	%struct.MarshalMethodName {
		i64 u0x000000160600093a, ; name: n_Read_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.4_name; char* name
	}, ; 4
	%struct.MarshalMethodName {
		i64 u0x0000001606000ad5, ; name: n_Equals_Ljava_lang_Object__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.5_name; char* name
	}, ; 5
	%struct.MarshalMethodName {
		i64 u0x0000001606000ad6, ; name: n_GetHashCode_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.6_name; char* name
	}, ; 6
	%struct.MarshalMethodName {
		i64 u0x0000001606000ad7, ; name: n_ToString_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.7_name; char* name
	}, ; 7
	%struct.MarshalMethodName {
		i64 u0x0000001606000958, ; name: n_Close_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.1_name; char* name
	}, ; 8
	%struct.MarshalMethodName {
		i64 u0x0000001606000959, ; name: n_Flush_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.8_name; char* name
	}, ; 9
	%struct.MarshalMethodName {
		i64 u0x000000160600095a, ; name: n_Write_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.9_name; char* name
	}, ; 10
	%struct.MarshalMethodName {
		i64 u0x000000160600095b, ; name: n_Write_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.10_name; char* name
	}, ; 11
	%struct.MarshalMethodName {
		i64 u0x000000160600095c, ; name: n_Write_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.11_name; char* name
	}, ; 12
	%struct.MarshalMethodName {
		i64 u0x0000001606000b69, ; name: n_Run_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.12_name; char* name
	}, ; 13
	%struct.MarshalMethodName {
		i64 u0x00000016060008ce, ; name: n_OnCreate_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.13_name; char* name
	}, ; 14
	%struct.MarshalMethodName {
		i64 u0x00000016060008cf, ; name: n_OnConfigurationChanged_Landroid_content_res_Configuration__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.14_name; char* name
	}, ; 15
	%struct.MarshalMethodName {
		i64 u0x00000016060008d0, ; name: n_OnPause_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.15_name; char* name
	}, ; 16
	%struct.MarshalMethodName {
		i64 u0x00000016060008d1, ; name: n_OnResume_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.16_name; char* name
	}, ; 17
	%struct.MarshalMethodName {
		i64 u0x00000016060008d2, ; name: n_OnDestroy_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.17_name; char* name
	}, ; 18
	%struct.MarshalMethodName {
		i64 u0x000000160600031d, ; name: n_OnKeyDown_ILandroid_view_KeyEvent__mm_wrapper(IntPtr,IntPtr,Int32,IntPtr)
		ptr @.MarshalMethodName.18_name; char* name
	}, ; 19
	%struct.MarshalMethodName {
		i64 u0x000000160600031e, ; name: n_OnKeyUp_ILandroid_view_KeyEvent__mm_wrapper(IntPtr,IntPtr,Int32,IntPtr)
		ptr @.MarshalMethodName.19_name; char* name
	}, ; 20
	%struct.MarshalMethodName {
		i64 u0x000000160600031f, ; name: n_OnGenericMotionEvent_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.20_name; char* name
	}, ; 21
	%struct.MarshalMethodName {
		i64 u0x00000016060003b0, ; name: n_SurfaceChanged_Landroid_view_SurfaceHolder_III_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32,Int32)
		ptr @.MarshalMethodName.21_name; char* name
	}, ; 22
	%struct.MarshalMethodName {
		i64 u0x00000016060003b1, ; name: n_SurfaceCreated_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.22_name; char* name
	}, ; 23
	%struct.MarshalMethodName {
		i64 u0x00000016060003b2, ; name: n_SurfaceDestroyed_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.23_name; char* name
	}, ; 24
	%struct.MarshalMethodName {
		i64 u0x000000160600032b, ; name: n_OnTouch_Landroid_view_View_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.24_name; char* name
	}, ; 25
	%struct.MarshalMethodName {
		i64 u0x00000016060004dc, ; name: n_OnOrientationChanged_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.25_name; char* name
	}, ; 26
	%struct.MarshalMethodName {
		i64 u0x0000001606000811, ; name: n_OnReceive_Landroid_content_Context_Landroid_content_Intent__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.26_name; char* name
	}, ; 27
	%struct.MarshalMethodName {
		i64 u0x0000000306000100, ; name: n_OnControllableInsetsChanged_Landroidx_core_view_WindowInsetsControllerCompat_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.27_name; char* name
	}, ; 28
	%struct.MarshalMethodName {
		i64 u0x0000001606000c14, ; name: n_Activate_mm(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.28_name; char* name
	}, ; 29
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.29_name; char* name
	} ; 30
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Marshal methods backing fields, pointers to native functions
@native_cb_onCompletion_0_0_60002de = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_close_0_1_6000937 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_1_6000938 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_1_6000939 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_1_600093a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_equals_0_2_6000ad5 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_hashCode_0_2_6000ad6 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_toString_0_2_6000ad7 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_close_0_3_6000958 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_flush_0_3_6000959 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_3_600095a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_3_600095b = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_3_600095c = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_run_0_4_6000b69 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onCreate_0_5_60008ce = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onConfigurationChanged_0_5_60008cf = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onPause_0_5_60008d0 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onResume_0_5_60008d1 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDestroy_0_5_60008d2 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onKeyDown_0_6_600031d = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onKeyUp_0_6_600031e = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onGenericMotionEvent_0_6_600031f = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_surfaceChanged_0_7_60003b0 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_surfaceCreated_0_7_60003b1 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_surfaceDestroyed_0_7_60003b2 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onTouch_0_8_600032b = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onOrientationChanged_0_9_60004dc = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onReceive_0_10_6000811 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onControllableInsetsChanged_1_11_6000100 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_activate_0_12_6000c14 = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.mm.13)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Method: System.Void Android.Media.MediaPlayer/IOnCompletionListenerInvoker::n_OnCompletion_Landroid_media_MediaPlayer__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Media.MediaPlayer/IOnCompletionListener::OnCompletion(Android.Media.MediaPlayer)
; Implemented: System.Void Android.Media.MediaPlayer/IOnCompletionListener::OnCompletion(Android.Media.MediaPlayer)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_media_MediaPlayer_1OnCompletionListenerImplementor_n_1onCompletion(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onCompletion_0_0_60002de, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 0, i32 noundef 100664030, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onCompletion_0_0_60002de)
	%cb2 = load ptr, ptr @native_cb_onCompletion_0_0_60002de, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Java.IO.InputStream::n_Close_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.InputStream::Close()
; Implemented: System.Void Android.Runtime.InputStreamAdapter::Close()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_InputStreamAdapter_n_1close(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_close_0_1_6000937, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 1, i32 noundef 100665655, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_close_0_1_6000937)
	%cb2 = load ptr, ptr @native_cb_close_0_1_6000937, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Int32 Java.IO.InputStream::n_Read_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read()
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_1_6000938, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 1, i32 noundef 100665656, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_1_6000938)
	%cb2 = load ptr, ptr @native_cb_read_0_1_6000938, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass)
	ret i32 %1
}

; Method: System.Int32 Java.IO.InputStream::n_Read_arrayB_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read(System.Byte[])
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read(System.Byte[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read___3B(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_1_6000939, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 1, i32 noundef 100665657, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_1_6000939)
	%cb2 = load ptr, ptr @native_cb_read_0_1_6000939, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes)
	ret i32 %1
}

; Method: System.Int32 Java.IO.InputStream::n_Read_arrayBII_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read(System.Byte[],System.Int32,System.Int32)
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read(System.Byte[],System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read___3BII(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes, i32 noundef %offset, i32 noundef %length) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_1_600093a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 1, i32 noundef 100665658, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_1_600093a)
	%cb2 = load ptr, ptr @native_cb_read_0_1_600093a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes, i32 noundef %offset, i32 noundef %length)
	ret i32 %1
}

; Method: System.SByte Java.Lang.Object::n_Equals_Ljava_lang_Object__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Java.Lang.Object::Equals(Java.Lang.Object)
; Implemented: System.Boolean Android.Runtime.JavaObject::Equals(Java.Lang.Object)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_mono_android_runtime_JavaObject_n_1equals(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_equals_0_2_6000ad5, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 2, i32 noundef 100666069, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_equals_0_2_6000ad5)
	%cb2 = load ptr, ptr @native_cb_equals_0_2_6000ad5, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.Int32 Java.Lang.Object::n_GetHashCode_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.Lang.Object::GetHashCode()
; Implemented: System.Int32 Android.Runtime.JavaObject::GetHashCode()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_JavaObject_n_1hashCode(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_hashCode_0_2_6000ad6, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 2, i32 noundef 100666070, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_hashCode_0_2_6000ad6)
	%cb2 = load ptr, ptr @native_cb_hashCode_0_2_6000ad6, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass)
	ret i32 %1
}

; Method: System.IntPtr Java.Lang.Object::n_ToString_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.String Java.Lang.Object::ToString()
; Implemented: System.String Android.Runtime.JavaObject::ToString()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_mono_android_runtime_JavaObject_n_1toString(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_toString_0_2_6000ad7, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 2, i32 noundef 100666071, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_toString_0_2_6000ad7)
	%cb2 = load ptr, ptr @native_cb_toString_0_2_6000ad7, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass)
	ret ptr %1
}

; Method: System.Void Java.IO.OutputStream::n_Close_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Close()
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Close()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1close(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_close_0_3_6000958, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 3, i32 noundef 100665688, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_close_0_3_6000958)
	%cb2 = load ptr, ptr @native_cb_close_0_3_6000958, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Flush_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Flush()
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Flush()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1flush(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_flush_0_3_6000959, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 3, i32 noundef 100665689, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_flush_0_3_6000959)
	%cb2 = load ptr, ptr @native_cb_flush_0_3_6000959, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_arrayB_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Byte[])
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Byte[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write___3B(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_3_600095a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 3, i32 noundef 100665690, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_3_600095a)
	%cb2 = load ptr, ptr @native_cb_write_0_3_600095a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_arrayBII_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Byte[],System.Int32,System.Int32)
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Byte[],System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write___3BII(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer, i32 noundef %offset, i32 noundef %length) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_3_600095b, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 3, i32 noundef 100665691, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_3_600095b)
	%cb2 = load ptr, ptr @native_cb_write_0_3_600095b, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer, i32 noundef %offset, i32 noundef %length)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Int32)
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write__I(ptr noundef %env, ptr noundef %klass, i32 noundef %oneByte) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_3_600095c, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 3, i32 noundef 100665692, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_3_600095c)
	%cb2 = load ptr, ptr @native_cb_write_0_3_600095c, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %oneByte)
	ret void
}

; Method: System.Void Java.Lang.IRunnableInvoker::n_Run_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.Lang.IRunnable::Run()
; Implemented: System.Void Java.Lang.IRunnable::Run()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_java_lang_RunnableImplementor_n_1run(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_run_0_4_6000b69, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 4, i32 noundef 100666217, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_run_0_4_6000b69)
	%cb2 = load ptr, ptr @native_cb_run_0_4_6000b69, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnCreate_Landroid_os_Bundle__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnCreate(Android.OS.Bundle)
; Implemented: System.Void Microsoft.Xna.Framework.AndroidGameActivity::OnCreate(Android.OS.Bundle)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64493ac3851fab1842_AndroidGameActivity_n_1onCreate__Landroid_os_Bundle_2(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onCreate_0_5_60008ce, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 5, i32 noundef 100665550, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onCreate_0_5_60008ce)
	%cb2 = load ptr, ptr @native_cb_onCreate_0_5_60008ce, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnCreate_Landroid_os_Bundle__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnCreate(Android.OS.Bundle)
; Implemented: System.Void BattleMushroom.Main::OnCreate(Android.OS.Bundle)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64158d7576b92bf39c_Main_n_1onCreate__Landroid_os_Bundle_2(ptr noundef %env, ptr noundef %klass, ptr noundef %bundle) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onCreate_0_5_60008ce, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 5, i32 noundef 100665550, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onCreate_0_5_60008ce)
	%cb2 = load ptr, ptr @native_cb_onCreate_0_5_60008ce, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %bundle)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnConfigurationChanged_Landroid_content_res_Configuration__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnConfigurationChanged(Android.Content.Res.Configuration)
; Implemented: System.Void Microsoft.Xna.Framework.AndroidGameActivity::OnConfigurationChanged(Android.Content.Res.Configuration)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64493ac3851fab1842_AndroidGameActivity_n_1onConfigurationChanged(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onConfigurationChanged_0_5_60008cf, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 5, i32 noundef 100665551, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onConfigurationChanged_0_5_60008cf)
	%cb2 = load ptr, ptr @native_cb_onConfigurationChanged_0_5_60008cf, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnPause_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnPause()
; Implemented: System.Void Microsoft.Xna.Framework.AndroidGameActivity::OnPause()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64493ac3851fab1842_AndroidGameActivity_n_1onPause(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onPause_0_5_60008d0, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 5, i32 noundef 100665552, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onPause_0_5_60008d0)
	%cb2 = load ptr, ptr @native_cb_onPause_0_5_60008d0, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnResume_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnResume()
; Implemented: System.Void Microsoft.Xna.Framework.AndroidGameActivity::OnResume()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64493ac3851fab1842_AndroidGameActivity_n_1onResume(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onResume_0_5_60008d1, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 5, i32 noundef 100665553, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onResume_0_5_60008d1)
	%cb2 = load ptr, ptr @native_cb_onResume_0_5_60008d1, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnDestroy_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnDestroy()
; Implemented: System.Void Microsoft.Xna.Framework.AndroidGameActivity::OnDestroy()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64493ac3851fab1842_AndroidGameActivity_n_1onDestroy(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDestroy_0_5_60008d2, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 5, i32 noundef 100665554, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDestroy_0_5_60008d2)
	%cb2 = load ptr, ptr @native_cb_onDestroy_0_5_60008d2, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.SByte Android.Views.View::n_OnKeyDown_ILandroid_view_KeyEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View::OnKeyDown(Android.Views.Keycode,Android.Views.KeyEvent)
; Implemented: System.Boolean Microsoft.Xna.Framework.MonoGameAndroidGameView::OnKeyDown(Android.Views.Keycode,Android.Views.KeyEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc64493ac3851fab1842_MonoGameAndroidGameView_n_1onKeyDown(ptr noundef %env, ptr noundef %klass, i32 noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onKeyDown_0_6_600031d, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 6, i32 noundef 100664093, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onKeyDown_0_6_600031d)
	%cb2 = load ptr, ptr @native_cb_onKeyDown_0_6_600031d, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, ptr noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.View::n_OnKeyUp_ILandroid_view_KeyEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View::OnKeyUp(Android.Views.Keycode,Android.Views.KeyEvent)
; Implemented: System.Boolean Microsoft.Xna.Framework.MonoGameAndroidGameView::OnKeyUp(Android.Views.Keycode,Android.Views.KeyEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc64493ac3851fab1842_MonoGameAndroidGameView_n_1onKeyUp(ptr noundef %env, ptr noundef %klass, i32 noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onKeyUp_0_6_600031e, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 6, i32 noundef 100664094, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onKeyUp_0_6_600031e)
	%cb2 = load ptr, ptr @native_cb_onKeyUp_0_6_600031e, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, ptr noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.View::n_OnGenericMotionEvent_Landroid_view_MotionEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View::OnGenericMotionEvent(Android.Views.MotionEvent)
; Implemented: System.Boolean Microsoft.Xna.Framework.MonoGameAndroidGameView::OnGenericMotionEvent(Android.Views.MotionEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc64493ac3851fab1842_MonoGameAndroidGameView_n_1onGenericMotionEvent(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onGenericMotionEvent_0_6_600031f, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 6, i32 noundef 100664095, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onGenericMotionEvent_0_6_600031f)
	%cb2 = load ptr, ptr @native_cb_onGenericMotionEvent_0_6_600031f, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.Void Android.Views.ISurfaceHolderCallbackInvoker::n_SurfaceChanged_Landroid_view_SurfaceHolder_III_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback::SurfaceChanged(Android.Views.ISurfaceHolder,Android.Graphics.Format,System.Int32,System.Int32)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback::SurfaceChanged(Android.Views.ISurfaceHolder,Android.Graphics.Format,System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64493ac3851fab1842_MonoGameAndroidGameView_n_1surfaceChanged(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceChanged_0_7_60003b0, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %4
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 7, i32 noundef 100664240, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceChanged_0_7_60003b0)
	%cb2 = load ptr, ptr @native_cb_surfaceChanged_0_7_60003b0, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %4
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %4]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallbackInvoker::n_SurfaceCreated_Landroid_view_SurfaceHolder__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback::SurfaceCreated(Android.Views.ISurfaceHolder)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback::SurfaceCreated(Android.Views.ISurfaceHolder)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64493ac3851fab1842_MonoGameAndroidGameView_n_1surfaceCreated(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceCreated_0_7_60003b1, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 7, i32 noundef 100664241, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceCreated_0_7_60003b1)
	%cb2 = load ptr, ptr @native_cb_surfaceCreated_0_7_60003b1, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallbackInvoker::n_SurfaceDestroyed_Landroid_view_SurfaceHolder__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback::SurfaceDestroyed(Android.Views.ISurfaceHolder)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback::SurfaceDestroyed(Android.Views.ISurfaceHolder)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64493ac3851fab1842_MonoGameAndroidGameView_n_1surfaceDestroyed(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceDestroyed_0_7_60003b2, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 7, i32 noundef 100664242, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceDestroyed_0_7_60003b2)
	%cb2 = load ptr, ptr @native_cb_surfaceDestroyed_0_7_60003b2, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.SByte Android.Views.View/IOnTouchListenerInvoker::n_OnTouch_Landroid_view_View_Landroid_view_MotionEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View/IOnTouchListener::OnTouch(Android.Views.View,Android.Views.MotionEvent)
; Implemented: System.Boolean Android.Views.View/IOnTouchListener::OnTouch(Android.Views.View,Android.Views.MotionEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc64493ac3851fab1842_MonoGameAndroidGameView_n_1onTouch(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onTouch_0_8_600032b, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 8, i32 noundef 100664107, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onTouch_0_8_600032b)
	%cb2 = load ptr, ptr @native_cb_onTouch_0_8_600032b, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret i1 %3
}

; Method: System.Void Android.Views.OrientationEventListener::n_OnOrientationChanged_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.OrientationEventListener::OnOrientationChanged(System.Int32)
; Implemented: System.Void Microsoft.Xna.Framework.OrientationListener::OnOrientationChanged(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64493ac3851fab1842_OrientationListener_n_1onOrientationChanged(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onOrientationChanged_0_9_60004dc, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 9, i32 noundef 100664540, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onOrientationChanged_0_9_60004dc)
	%cb2 = load ptr, ptr @native_cb_onOrientationChanged_0_9_60004dc, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret void
}

; Method: System.Void Android.Content.BroadcastReceiver::n_OnReceive_Landroid_content_Context_Landroid_content_Intent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Content.BroadcastReceiver::OnReceive(Android.Content.Context,Android.Content.Intent)
; Implemented: System.Void Microsoft.Xna.Framework.ScreenReceiver::OnReceive(Android.Content.Context,Android.Content.Intent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64493ac3851fab1842_ScreenReceiver_n_1onReceive(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onReceive_0_10_6000811, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 10, i32 noundef 100665361, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onReceive_0_10_6000811)
	%cb2 = load ptr, ptr @native_cb_onReceive_0_10_6000811, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret void
}

; Method: System.Void AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListenerInvoker::n_OnControllableInsetsChanged_Landroidx_core_view_WindowInsetsControllerCompat_I_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListener::OnControllableInsetsChanged(AndroidX.Core.View.WindowInsetsControllerCompat,System.Int32)
; Implemented: System.Void AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListener::OnControllableInsetsChanged(AndroidX.Core.View.WindowInsetsControllerCompat,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_core_view_WindowInsetsControllerCompat_1OnControllableInsetsChangedListenerImplementor_n_1onControllableInsetsChanged(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onControllableInsetsChanged_1_11_6000100, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 3, i32 noundef 11, i32 noundef 100663552, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onControllableInsetsChanged_1_11_6000100)
	%cb2 = load ptr, ptr @native_cb_onControllableInsetsChanged_1_11_6000100, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1)
	ret void
}

; Method: System.Void Java.Interop.TypeManager/JavaTypeManager::n_Activate_mm(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: none
; Implemented: none
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_TypeManager_n_1activate(ptr noundef %env, ptr noundef %klass, ptr noundef %jnienv, ptr noundef %jclass, ptr noundef %typename_ptr, ptr noundef %signature_ptr) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_activate_0_12_6000c14, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 12, i32 noundef 100666388, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_activate_0_12_6000c14)
	%cb2 = load ptr, ptr @native_cb_activate_0_12_6000c14, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %jnienv, ptr noundef %jclass, ptr noundef %typename_ptr, ptr noundef %signature_ptr)
	ret void
}

; Strings
@.mm.0 = private unnamed_addr constant [136 x i8] c"Android.Media.MediaPlayer/IOnCompletionListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.1 = private unnamed_addr constant [101 x i8] c"Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.2 = private unnamed_addr constant [98 x i8] c"Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.3 = private unnamed_addr constant [102 x i8] c"Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.4 = private unnamed_addr constant [108 x i8] c"Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.5 = private unnamed_addr constant [102 x i8] c"Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.6 = private unnamed_addr constant [100 x i8] c"Android.Views.View, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.7 = private unnamed_addr constant [125 x i8] c"Android.Views.ISurfaceHolderCallbackInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.8 = private unnamed_addr constant [124 x i8] c"Android.Views.View/IOnTouchListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.9 = private unnamed_addr constant [120 x i8] c"Android.Views.OrientationEventListener, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.10 = private unnamed_addr constant [115 x i8] c"Android.Content.BroadcastReceiver, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.11 = private unnamed_addr constant [170 x i8] c"AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.12 = private unnamed_addr constant [122 x i8] c"Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.13 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [76 x i8] c"n_OnCompletion_Landroid_media_MediaPlayer__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.1_name = private unnamed_addr constant [34 x i8] c"n_Close_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.2_name = private unnamed_addr constant [33 x i8] c"n_Read_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.3_name = private unnamed_addr constant [47 x i8] c"n_Read_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.4_name = private unnamed_addr constant [61 x i8] c"n_Read_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.5_name = private unnamed_addr constant [61 x i8] c"n_Equals_Ljava_lang_Object__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.6_name = private unnamed_addr constant [40 x i8] c"n_GetHashCode_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.7_name = private unnamed_addr constant [37 x i8] c"n_ToString_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.8_name = private unnamed_addr constant [34 x i8] c"n_Flush_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.9_name = private unnamed_addr constant [48 x i8] c"n_Write_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.10_name = private unnamed_addr constant [62 x i8] c"n_Write_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.11_name = private unnamed_addr constant [42 x i8] c"n_Write_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.12_name = private unnamed_addr constant [32 x i8] c"n_Run_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.13_name = private unnamed_addr constant [64 x i8] c"n_OnCreate_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.14_name = private unnamed_addr constant [94 x i8] c"n_OnConfigurationChanged_Landroid_content_res_Configuration__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.15_name = private unnamed_addr constant [36 x i8] c"n_OnPause_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.16_name = private unnamed_addr constant [37 x i8] c"n_OnResume_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.17_name = private unnamed_addr constant [38 x i8] c"n_OnDestroy_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.18_name = private unnamed_addr constant [76 x i8] c"n_OnKeyDown_ILandroid_view_KeyEvent__mm_wrapper(IntPtr,IntPtr,Int32,IntPtr)\00", align 1
@.MarshalMethodName.19_name = private unnamed_addr constant [74 x i8] c"n_OnKeyUp_ILandroid_view_KeyEvent__mm_wrapper(IntPtr,IntPtr,Int32,IntPtr)\00", align 1
@.MarshalMethodName.20_name = private unnamed_addr constant [83 x i8] c"n_OnGenericMotionEvent_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.21_name = private unnamed_addr constant [100 x i8] c"n_SurfaceChanged_Landroid_view_SurfaceHolder_III_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32,Int32)\00", align 1
@.MarshalMethodName.22_name = private unnamed_addr constant [79 x i8] c"n_SurfaceCreated_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.23_name = private unnamed_addr constant [81 x i8] c"n_SurfaceDestroyed_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.24_name = private unnamed_addr constant [96 x i8] c"n_OnTouch_Landroid_view_View_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.25_name = private unnamed_addr constant [57 x i8] c"n_OnOrientationChanged_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.26_name = private unnamed_addr constant [102 x i8] c"n_OnReceive_Landroid_content_Context_Landroid_content_Intent__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.27_name = private unnamed_addr constant [120 x i8] c"n_OnControllableInsetsChanged_Landroidx_core_view_WindowInsetsControllerCompat_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.28_name = private unnamed_addr constant [57 x i8] c"n_Activate_mm(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.29_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }
attributes #3 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ e1d3646df9cb50b2a0924f5b67fa78f9750ae489"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
