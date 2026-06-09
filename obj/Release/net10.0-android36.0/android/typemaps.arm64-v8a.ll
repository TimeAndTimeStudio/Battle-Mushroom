; ModuleID = 'typemaps.arm64-v8a.ll'
source_filename = "typemaps.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.TypeMapJava = type {
	i32, ; uint32_t module_index
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_name_index
}

%struct.TypeMapModule = type {
	[16 x i8], ; uint8_t module_uuid[16]
	i32, ; uint32_t entry_count
	i32, ; uint32_t duplicate_count
	ptr, ; TypeMapModuleEntry map
	ptr, ; TypeMapModuleEntry duplicate_map
	ptr, ; char* assembly_name
	ptr, ; MonoImage image
	i32, ; uint32_t java_name_width
	ptr ; uint8_t java_map
}

%struct.TypeMapModuleEntry = type {
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_map_index
}

@map_module_count = dso_local local_unnamed_addr constant i32 5, align 4

@java_type_count = dso_local local_unnamed_addr constant i32 166, align 4

; Managed modules map
@map_modules = dso_local local_unnamed_addr global [5 x %struct.TypeMapModule] [
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x6b, i8 u0x54, i8 u0x2e, i8 u0xd8, i8 u0x77, i8 u0x06, i8 u0x52, i8 u0x4c, i8 u0x8b, i8 u0xd4, i8 u0x05, i8 u0x20, i8 u0xda, i8 u0x09, i8 u0xd6, i8 u0x7f ], ; module_uuid: d82e546b-0677-4c52-8bd4-0520da09d67f
		i32 4, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module0_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.0_assembly_name, ; assembly_name: MonoGame.Framework
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 0
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x6c, i8 u0x79, i8 u0x48, i8 u0xa4, i8 u0x8d, i8 u0xa9, i8 u0x78, i8 u0x41, i8 u0xa6, i8 u0x96, i8 u0x6d, i8 u0xa7, i8 u0x7e, i8 u0x23, i8 u0xce, i8 u0x53 ], ; module_uuid: a448796c-a98d-4178-a696-6da77e23ce53
		i32 1, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module1_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.1_assembly_name, ; assembly_name: BattleMushroom
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 1
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x99, i8 u0x60, i8 u0x36, i8 u0x8b, i8 u0x9c, i8 u0xa0, i8 u0xdc, i8 u0x4b, i8 u0x89, i8 u0x10, i8 u0x15, i8 u0x82, i8 u0xdd, i8 u0xb1, i8 u0x01, i8 u0x16 ], ; module_uuid: 8b366099-a09c-4bdc-8910-1582ddb10116
		i32 10, ; uint32_t entry_count
		i32 2, ; uint32_t duplicate_count
		ptr @module2_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module2_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.2_assembly_name, ; assembly_name: Xamarin.AndroidX.Core
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 2
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xc7, i8 u0x6d, i8 u0xea, i8 u0xf2, i8 u0x50, i8 u0x54, i8 u0x1e, i8 u0x4b, i8 u0x99, i8 u0xe8, i8 u0xfc, i8 u0x0a, i8 u0x95, i8 u0x0a, i8 u0x5d, i8 u0x41 ], ; module_uuid: f2ea6dc7-5450-4b1e-99e8-fc0a950a5d41
		i32 14, ; uint32_t entry_count
		i32 2, ; uint32_t duplicate_count
		ptr @module3_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module3_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.3_assembly_name, ; assembly_name: Java.Interop
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 3
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xed, i8 u0x7c, i8 u0xbf, i8 u0xe8, i8 u0xbc, i8 u0x09, i8 u0xdb, i8 u0x47, i8 u0xab, i8 u0x60, i8 u0x8b, i8 u0x71, i8 u0x76, i8 u0x9c, i8 u0xf1, i8 u0xbe ], ; module_uuid: e8bf7ced-09bc-47db-ab60-8b71769cf1be
		i32 139, ; uint32_t entry_count
		i32 49, ; uint32_t duplicate_count
		ptr @module4_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module4_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.4_assembly_name, ; assembly_name: Mono.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	} ; 4
], align 8

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [166 x i64] [
	i64 u0x01cd624f1e38cc9f, ; 0 => java/lang/Byte
	i64 u0x087fb80a227e5598, ; 1 => android/view/OrientationEventListener
	i64 u0x08ba5597603eed52, ; 2 => androidx/core/view/WindowInsetsAnimationControlListenerCompat
	i64 u0x0a364502506e12a9, ; 3 => android/os/CancellationSignal
	i64 u0x0b1da699fb29019a, ; 4 => android/os/BaseBundle
	i64 u0x0c44130caa233945, ; 5 => mono/android/runtime/JavaObject
	i64 u0x0d9335f0988cd796, ; 6 => java/util/HashMap
	i64 u0x0e06a6e8c0440173, ; 7 => crc64493ac3851fab1842/OrientationListener
	i64 u0x102731205d6f1f1c, ; 8 => android/graphics/Path
	i64 u0x103d8579c39974d7, ; 9 => androidx/core/view/DisplayCutoutCompat
	i64 u0x110217f9f8accd72, ; 10 => android/view/WindowInsetsController
	i64 u0x11487815b4917a9b, ; 11 => javax/microedition/khronos/egl/EGLConfig
	i64 u0x11cef49ec24439a7, ; 12 => androidx/core/graphics/Insets
	i64 u0x167be582da7ac6ee, ; 13 => android/view/WindowInsetsController$OnControllableInsetsChangedListener
	i64 u0x1759b71b41bc5f1b, ; 14 => android/content/pm/PackageItemInfo
	i64 u0x194b32fbae047fc7, ; 15 => net/dot/jni/internal/JavaProxyObject
	i64 u0x1950fac852291891, ; 16 => android/view/WindowInsetsAnimationControlListener
	i64 u0x1e04bf19f9c14045, ; 17 => android/util/AttributeSet
	i64 u0x1e69018626ef9ffb, ; 18 => android/os/Handler
	i64 u0x1e72ebd893590a84, ; 19 => mono/androidx/core/view/WindowInsetsControllerCompat_OnControllableInsetsChangedListenerImplementor
	i64 u0x1eef7492beaf81e2, ; 20 => android/os/IInterface
	i64 u0x1f60d95e7953fe94, ; 21 => android/media/AudioManager
	i64 u0x1fb6522f1211b131, ; 22 => androidx/core/view/WindowInsetsCompat
	i64 u0x20c60d9d7d4c5026, ; 23 => android/provider/Settings$System
	i64 u0x22436d73eb9797a7, ; 24 => android/content/IntentFilter
	i64 u0x225c20a45cb91cd7, ; 25 => java/lang/Error
	i64 u0x228edb5145b4bbc1, ; 26 => android/view/InputEvent
	i64 u0x24d34cdbf04208f8, ; 27 => android/window/InputTransferToken
	i64 u0x24f44152583c2169, ; 28 => androidx/core/view/WindowInsetsCompat$Type
	i64 u0x2e53f681878e0c07, ; 29 => android/util/AndroidException
	i64 u0x321c29cf8c6f7a93, ; 30 => android/content/res/Resources
	i64 u0x32d6a1d6ee9f6d5a, ; 31 => android/content/Intent
	i64 u0x332031975eda7654, ; 32 => java/lang/Boolean
	i64 u0x333aab094589d187, ; 33 => javax/microedition/khronos/egl/EGL10
	i64 u0x33eb4c8b20982c90, ; 34 => crc64493ac3851fab1842/AndroidGameActivity
	i64 u0x34a4414d9498be08, ; 35 => androidx/core/view/WindowInsetsControllerCompat
	i64 u0x35e989807a64bcd9, ; 36 => java/lang/IllegalStateException
	i64 u0x39f1c81500ddb55b, ; 37 => [F
	i64 u0x3eb16b7dcf56c048, ; 38 => android/provider/Settings$SettingNotFoundException
	i64 u0x406e54c64b3bee74, ; 39 => android/runtime/JavaProxyThrowable
	i64 u0x40c05cff47992547, ; 40 => android/view/ViewGroup
	i64 u0x4205de8badabfc45, ; 41 => android/os/Process
	i64 u0x4c432ae0343ec997, ; 42 => crc64158d7576b92bf39c/Main
	i64 u0x4da4ac13d373d9d4, ; 43 => android/view/SurfaceHolder$Callback
	i64 u0x4f858ea9c9162f43, ; 44 => android/os/IBinder
	i64 u0x505b1379ff157a72, ; 45 => android/view/Surface
	i64 u0x516bd5763f07d608, ; 46 => android/net/Uri
	i64 u0x5181b129b1a25949, ; 47 => java/lang/Class
	i64 u0x5238ad63b58da994, ; 48 => java/lang/ClassCastException
	i64 u0x529da4201fa0d461, ; 49 => net/dot/jni/internal/JavaProxyThrowable
	i64 u0x53ead18b9df3fcb2, ; 50 => android/os/IBinder$FrozenStateChangeCallback
	i64 u0x53fff212036ac456, ; 51 => javax/microedition/khronos/egl/EGL
	i64 u0x551ac881eb4466c0, ; 52 => java/lang/Number
	i64 u0x55ad657acdd3959a, ; 53 => javax/microedition/khronos/egl/EGLSurface
	i64 u0x560a92597b121e00, ; 54 => [C
	i64 u0x56365290d5a06704, ; 55 => java/lang/LinkageError
	i64 u0x5681ede87251094b, ; 56 => android/graphics/Point
	i64 u0x57fe4a40460344db, ; 57 => android/os/Build$VERSION
	i64 u0x58f3414ff259c4b8, ; 58 => android/view/WindowManager
	i64 u0x5a6af884fe3c181e, ; 59 => android/os/Bundle
	i64 u0x5ada57ed19188a73, ; 60 => android/media/MediaPlayer
	i64 u0x5bfd65ae1a6e6ffc, ; 61 => android/app/Activity
	i64 u0x5c2a60c822a3770a, ; 62 => android/view/Choreographer
	i64 u0x5e1c513312ebc1b3, ; 63 => android/view/KeyEvent
	i64 u0x5e38b925960b7be9, ; 64 => android/graphics/Rect
	i64 u0x5f5a9fc3430795a4, ; 65 => android/content/ContextWrapper
	i64 u0x5f7e709faf8646e0, ; 66 => java/lang/Short
	i64 u0x61428f9f249ac534, ; 67 => [Z
	i64 u0x6149cc868c1eff6d, ; 68 => android/view/SurfaceControlInputReceiver
	i64 u0x62daf35c931c09d6, ; 69 => android/content/BroadcastReceiver
	i64 u0x65f6b14b7e978927, ; 70 => java/io/IOException
	i64 u0x6d736771e9774ab2, ; 71 => androidx/core/view/WindowInsetsAnimationControllerCompat
	i64 u0x6e0fb15bd0f04d15, ; 72 => java/lang/StackTraceElement
	i64 u0x6ef4975bdb7af18f, ; 73 => android/view/MotionEvent
	i64 u0x6ef7816e17e24358, ; 74 => android/graphics/Canvas
	i64 u0x703efa6e1ccb459a, ; 75 => android/window/TrustedPresentationThresholds
	i64 u0x71715828b1fce114, ; 76 => android/view/InputDevice
	i64 u0x720cd712e1248c34, ; 77 => java/util/Iterator
	i64 u0x75591c18ddf5e52d, ; 78 => mono/android/TypeManager
	i64 u0x76cbd2104dd555ed, ; 79 => android/content/Context
	i64 u0x7b90c42bde036cae, ; 80 => [I
	i64 u0x7b925bdca68a0101, ; 81 => java/util/ArrayList
	i64 u0x7bc72d027e66ad3c, ; 82 => android/view/Display
	i64 u0x7e201ad40955df46, ; 83 => android/os/Parcel
	i64 u0x803c00108539f471, ; 84 => androidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener
	i64 u0x8088098b52e9f916, ; 85 => android/app/KeyguardManager
	i64 u0x84f94178aab6cc34, ; 86 => java/lang/CharSequence
	i64 u0x852b5457ebdd5c87, ; 87 => android/view/ViewGroup$LayoutParams
	i64 u0x888700b03d541d93, ; 88 => java/lang/RuntimeException
	i64 u0x88f7510c649f4a97, ; 89 => java/io/InputStream
	i64 u0x89bb78ecf66b1453, ; 90 => android/view/SurfaceControl
	i64 u0x8a3ea3c274e8ce68, ; 91 => java/lang/Character
	i64 u0x8c9cbedbb1657afd, ; 92 => android/content/pm/ApplicationInfo
	i64 u0x90b4aeb45636cd6a, ; 93 => mono/android/runtime/OutputStreamAdapter
	i64 u0x912b555aa0007288, ; 94 => android/view/ViewManager
	i64 u0x92188d393e2af2d2, ; 95 => java/lang/Throwable
	i64 u0x92b59c839bc46278, ; 96 => java/lang/Thread
	i64 u0x965bfaf1ff1da014, ; 97 => java/lang/ReflectiveOperationException
	i64 u0x966d53c70495b4c0, ; 98 => crc64493ac3851fab1842/MonoGameAndroidGameView
	i64 u0x98ba110c6c57da31, ; 99 => java/lang/Float
	i64 u0x99b4bc4a856dc9da, ; 100 => android/content/pm/PackageManager
	i64 u0x99df91bab800c287, ; 101 => mono/android/runtime/InputStreamAdapter
	i64 u0x9a68fa465ca8abf9, ; 102 => java/io/FileDescriptor
	i64 u0x9e10a0b3efa170dc, ; 103 => android/view/ContextThemeWrapper
	i64 u0x9fa1370a1b1093fa, ; 104 => java/lang/NullPointerException
	i64 u0x9fffe5ad5d77dedd, ; 105 => android/os/Vibrator
	i64 u0xa24d07cd0d5c4f0f, ; 106 => android/animation/TimeInterpolator
	i64 u0xa588668feb1b05b9, ; 107 => android/view/SurfaceView
	i64 u0xa865adbdd81d9951, ; 108 => java/io/OutputStream
	i64 u0xaa7b11cdd6000676, ; 109 => android/provider/Settings
	i64 u0xabc3cd0f40f748aa, ; 110 => java/lang/String
	i64 u0xac9902bb0e4c5217, ; 111 => java/lang/IllegalArgumentException
	i64 u0xacaf4fe23af1f72a, ; 112 => [S
	i64 u0xada6872f699d2ae8, ; 113 => [J
	i64 u0xb02badeb1c97535c, ; 114 => java/lang/Integer
	i64 u0xb18d71343ca8e96f, ; 115 => java/lang/Exception
	i64 u0xb209d55b71ead22c, ; 116 => android/view/animation/Interpolator
	i64 u0xb378438cc777bbf0, ; 117 => android/view/WindowManager$LayoutParams
	i64 u0xb3af78a90094279d, ; 118 => crc64493ac3851fab1842/ScreenReceiver
	i64 u0xb56e3efa284790aa, ; 119 => android/view/WindowInsets
	i64 u0xb69317d4cbae2478, ; 120 => android/content/res/Configuration
	i64 u0xb6c4749da9477c3a, ; 121 => [B
	i64 u0xb7f60ace3fa0816b, ; 122 => android/view/Window
	i64 u0xb8df224d6b778ca3, ; 123 => android/view/View
	i64 u0xbb84ccbe48f6c18b, ; 124 => android/os/Looper
	i64 u0xbf6d427143271cb3, ; 125 => java/lang/Object
	i64 u0xbf9dae2beff68075, ; 126 => android/graphics/Insets
	i64 u0xc00f4c2f11efdcff, ; 127 => java/lang/ClassNotFoundException
	i64 u0xc2a8e50a5f08afc6, ; 128 => mono/java/lang/RunnableImplementor
	i64 u0xc2d2916e08f7fcd5, ; 129 => android/view/WindowInsetsAnimationController
	i64 u0xc9907bd32c160fff, ; 130 => android/util/Log
	i64 u0xca35caf567cfa745, ; 131 => java/util/Collection
	i64 u0xcb4af9b128fa333f, ; 132 => android/view/SurfaceHolder
	i64 u0xcc306823503920e9, ; 133 => android/app/Application
	i64 u0xccd0f5b101ef6e90, ; 134 => android/os/VibratorManager
	i64 u0xd1b288a9c7bb8f53, ; 135 => java/lang/Double
	i64 u0xd209f455b02d0c6b, ; 136 => android/media/MediaPlayer$OnCompletionListener
	i64 u0xd2fc750314fd2213, ; 137 => [D
	i64 u0xd5a28b8fa6d48e71, ; 138 => android/os/Build
	i64 u0xd7bf0ca2c70de05c, ; 139 => android/util/DisplayMetrics
	i64 u0xdbb76cb30e7b6509, ; 140 => android/content/ContentResolver
	i64 u0xdd812f1d4afa427b, ; 141 => java/lang/UnsupportedOperationException
	i64 u0xdfabd9351f4351a6, ; 142 => [Ljava/lang/Object;
	i64 u0xe024b538ad65ea66, ; 143 => java/util/function/Consumer
	i64 u0xe0446bf91fb0c2dd, ; 144 => java/lang/NoClassDefFoundError
	i64 u0xe1b3c5871398eb28, ; 145 => java/nio/channels/FileChannel
	i64 u0xe38528954b158fff, ; 146 => java/util/concurrent/Executor
	i64 u0xe39829b35e720e04, ; 147 => java/util/function/IntConsumer
	i64 u0xe5abbaa9de37d34b, ; 148 => net/dot/jni/ManagedPeer
	i64 u0xe7c5168fd08808ad, ; 149 => android/content/res/AssetFileDescriptor
	i64 u0xe8b52a7318e34a5d, ; 150 => androidx/core/view/WindowCompat
	i64 u0xe8d0c30ab85673ff, ; 151 => android/view/View$OnTouchListener
	i64 u0xe94dd9d7a0bada9f, ; 152 => android/content/res/AssetManager
	i64 u0xeb82145dcac4c559, ; 153 => java/lang/Long
	i64 u0xed49ed70aa9be1b3, ; 154 => java/nio/channels/spi/AbstractInterruptibleChannel
	i64 u0xeed97b1a03611806, ; 155 => javax/microedition/khronos/egl/EGLContext
	i64 u0xef2f2996a1d369cc, ; 156 => java/io/FileInputStream
	i64 u0xf11f22a6441fcfbc, ; 157 => java/lang/IndexOutOfBoundsException
	i64 u0xf15bb28304fee21c, ; 158 => android/provider/Settings$NameValueTable
	i64 u0xf2c41c638398c823, ; 159 => mono/android/media/MediaPlayer_OnCompletionListenerImplementor
	i64 u0xfbe9bfa5cc50fed6, ; 160 => java/util/HashSet
	i64 u0xfc1f778c1b18818c, ; 161 => android/view/KeyCharacterMap
	i64 u0xfd2b1a3de667eb51, ; 162 => java/lang/Runnable
	i64 u0xfd45cc49d3236300, ; 163 => android/os/IBinder$DeathRecipient
	i64 u0xfd853b4373fcc7f1, ; 164 => android/view/WindowMetrics
	i64 u0xff1fe60c1de18005 ; 165 => javax/microedition/khronos/egl/EGLDisplay
], align 8

@module0_managed_to_java = internal dso_local constant [4 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000114, ; uint32_t type_token_id
		i32 34; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000118, ; uint32_t type_token_id
		i32 98; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000121, ; uint32_t type_token_id
		i32 7; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000122, ; uint32_t type_token_id
		i32 118; uint32_t java_map_index
	} ; 3
], align 4

@module1_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 42; uint32_t java_map_index
	} ; 0
], align 4

@module2_managed_to_java = internal dso_local constant [10 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 12; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 9; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 2; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 150; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 71; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 22; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 28; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000013, ; uint32_t type_token_id
		i32 35; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 84; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000017, ; uint32_t type_token_id
		i32 19; uint32_t java_map_index
	} ; 9
], align 4

@module2_managed_to_java_duplicates = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000e, ; uint32_t type_token_id
		i32 2; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000015, ; uint32_t type_token_id
		i32 84; uint32_t java_map_index
	} ; 1
], align 4

@module3_managed_to_java = internal dso_local constant [14 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 142; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 95; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 125; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 67; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000030, ; uint32_t type_token_id
		i32 121; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000034, ; uint32_t type_token_id
		i32 54; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 112; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 80; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000040, ; uint32_t type_token_id
		i32 113; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000044, ; uint32_t type_token_id
		i32 37; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000048, ; uint32_t type_token_id
		i32 137; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 15; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 49; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000094, ; uint32_t type_token_id
		i32 148; uint32_t java_map_index
	} ; 13
], align 4

@module3_managed_to_java_duplicates = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 142; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 142; uint32_t java_map_index
	} ; 1
], align 4

@module4_managed_to_java = internal dso_local constant [139 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000051, ; uint32_t type_token_id
		i32 155; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000052, ; uint32_t type_token_id
		i32 11; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000055, ; uint32_t type_token_id
		i32 165; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000057, ; uint32_t type_token_id
		i32 53; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000059, ; uint32_t type_token_id
		i32 51; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200005b, ; uint32_t type_token_id
		i32 33; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200005d, ; uint32_t type_token_id
		i32 27; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 75; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 109; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000060, ; uint32_t type_token_id
		i32 158; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000061, ; uint32_t type_token_id
		i32 38; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000062, ; uint32_t type_token_id
		i32 23; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000063, ; uint32_t type_token_id
		i32 130; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000064, ; uint32_t type_token_id
		i32 29; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000065, ; uint32_t type_token_id
		i32 139; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000066, ; uint32_t type_token_id
		i32 17; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000068, ; uint32_t type_token_id
		i32 18; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000069, ; uint32_t type_token_id
		i32 105; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200006a, ; uint32_t type_token_id
		i32 4; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x0200006b, ; uint32_t type_token_id
		i32 138; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x0200006c, ; uint32_t type_token_id
		i32 57; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x0200006e, ; uint32_t type_token_id
		i32 59; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x0200006f, ; uint32_t type_token_id
		i32 3; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x02000070, ; uint32_t type_token_id
		i32 163; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x02000072, ; uint32_t type_token_id
		i32 44; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x02000073, ; uint32_t type_token_id
		i32 50; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x02000076, ; uint32_t type_token_id
		i32 20; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x02000078, ; uint32_t type_token_id
		i32 124; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x02000079, ; uint32_t type_token_id
		i32 83; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x0200007a, ; uint32_t type_token_id
		i32 41; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 134; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x0200007f, ; uint32_t type_token_id
		i32 21; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x02000080, ; uint32_t type_token_id
		i32 60; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x02000081, ; uint32_t type_token_id
		i32 136; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x02000083, ; uint32_t type_token_id
		i32 159; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x0200008a, ; uint32_t type_token_id
		i32 106; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x0200008c, ; uint32_t type_token_id
		i32 117; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x0200008d, ; uint32_t type_token_id
		i32 123; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x0200008e, ; uint32_t type_token_id
		i32 151; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x02000090, ; uint32_t type_token_id
		i32 76; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x02000091, ; uint32_t type_token_id
		i32 161; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x02000092, ; uint32_t type_token_id
		i32 63; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x02000093, ; uint32_t type_token_id
		i32 73; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x02000094, ; uint32_t type_token_id
		i32 122; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x02000096, ; uint32_t type_token_id
		i32 62; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x02000097, ; uint32_t type_token_id
		i32 103; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x02000098, ; uint32_t type_token_id
		i32 82; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x02000099, ; uint32_t type_token_id
		i32 26; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x0200009c, ; uint32_t type_token_id
		i32 68; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x0200009e, ; uint32_t type_token_id
		i32 43; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x020000a0, ; uint32_t type_token_id
		i32 132; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x020000a2, ; uint32_t type_token_id
		i32 94; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x020000a4, ; uint32_t type_token_id
		i32 129; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x020000a6, ; uint32_t type_token_id
		i32 16; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x020000a8, ; uint32_t type_token_id
		i32 10; uint32_t java_map_index
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 u0x020000a9, ; uint32_t type_token_id
		i32 13; uint32_t java_map_index
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 u0x020000ac, ; uint32_t type_token_id
		i32 58; uint32_t java_map_index
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 u0x020000b1, ; uint32_t type_token_id
		i32 1; uint32_t java_map_index
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 u0x020000b3, ; uint32_t type_token_id
		i32 45; uint32_t java_map_index
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 u0x020000b4, ; uint32_t type_token_id
		i32 90; uint32_t java_map_index
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 u0x020000b7, ; uint32_t type_token_id
		i32 107; uint32_t java_map_index
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 u0x020000b8, ; uint32_t type_token_id
		i32 40; uint32_t java_map_index
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 u0x020000b9, ; uint32_t type_token_id
		i32 87; uint32_t java_map_index
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 u0x020000bd, ; uint32_t type_token_id
		i32 119; uint32_t java_map_index
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 u0x020000bf, ; uint32_t type_token_id
		i32 164; uint32_t java_map_index
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 u0x020000c0, ; uint32_t type_token_id
		i32 116; uint32_t java_map_index
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 u0x020000d5, ; uint32_t type_token_id
		i32 101; uint32_t java_map_index
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 u0x020000d8, ; uint32_t type_token_id
		i32 131; uint32_t java_map_index
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 u0x020000da, ; uint32_t type_token_id
		i32 6; uint32_t java_map_index
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 u0x020000e3, ; uint32_t type_token_id
		i32 81; uint32_t java_map_index
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 u0x020000e5, ; uint32_t type_token_id
		i32 5; uint32_t java_map_index
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 u0x020000e6, ; uint32_t type_token_id
		i32 39; uint32_t java_map_index
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 u0x020000e7, ; uint32_t type_token_id
		i32 160; uint32_t java_map_index
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 u0x020000f3, ; uint32_t type_token_id
		i32 93; uint32_t java_map_index
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 u0x020000fb, ; uint32_t type_token_id
		i32 46; uint32_t java_map_index
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 u0x020000fe, ; uint32_t type_token_id
		i32 74; uint32_t java_map_index
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 u0x02000100, ; uint32_t type_token_id
		i32 126; uint32_t java_map_index
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 u0x02000101, ; uint32_t type_token_id
		i32 8; uint32_t java_map_index
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 u0x02000102, ; uint32_t type_token_id
		i32 56; uint32_t java_map_index
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 u0x02000103, ; uint32_t type_token_id
		i32 64; uint32_t java_map_index
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 u0x02000104, ; uint32_t type_token_id
		i32 79; uint32_t java_map_index
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 u0x02000105, ; uint32_t type_token_id
		i32 31; uint32_t java_map_index
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 u0x02000106, ; uint32_t type_token_id
		i32 69; uint32_t java_map_index
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 u0x02000108, ; uint32_t type_token_id
		i32 140; uint32_t java_map_index
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 u0x0200010b, ; uint32_t type_token_id
		i32 65; uint32_t java_map_index
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 u0x0200010c, ; uint32_t type_token_id
		i32 24; uint32_t java_map_index
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 u0x0200010d, ; uint32_t type_token_id
		i32 149; uint32_t java_map_index
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 u0x0200010e, ; uint32_t type_token_id
		i32 152; uint32_t java_map_index
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 u0x0200010f, ; uint32_t type_token_id
		i32 120; uint32_t java_map_index
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 u0x02000111, ; uint32_t type_token_id
		i32 30; uint32_t java_map_index
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 u0x02000112, ; uint32_t type_token_id
		i32 100; uint32_t java_map_index
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 u0x02000113, ; uint32_t type_token_id
		i32 92; uint32_t java_map_index
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 u0x02000116, ; uint32_t type_token_id
		i32 14; uint32_t java_map_index
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 u0x0200011a, ; uint32_t type_token_id
		i32 61; uint32_t java_map_index
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 u0x0200011b, ; uint32_t type_token_id
		i32 133; uint32_t java_map_index
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 u0x0200011f, ; uint32_t type_token_id
		i32 85; uint32_t java_map_index
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 u0x02000120, ; uint32_t type_token_id
		i32 145; uint32_t java_map_index
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 u0x02000122, ; uint32_t type_token_id
		i32 154; uint32_t java_map_index
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 u0x02000124, ; uint32_t type_token_id
		i32 102; uint32_t java_map_index
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 u0x02000125, ; uint32_t type_token_id
		i32 156; uint32_t java_map_index
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 u0x02000126, ; uint32_t type_token_id
		i32 89; uint32_t java_map_index
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 u0x02000128, ; uint32_t type_token_id
		i32 70; uint32_t java_map_index
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 u0x02000129, ; uint32_t type_token_id
		i32 108; uint32_t java_map_index
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 u0x0200012b, ; uint32_t type_token_id
		i32 77; uint32_t java_map_index
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 u0x0200012d, ; uint32_t type_token_id
		i32 143; uint32_t java_map_index
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 u0x0200012f, ; uint32_t type_token_id
		i32 147; uint32_t java_map_index
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 u0x02000131, ; uint32_t type_token_id
		i32 146; uint32_t java_map_index
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 u0x02000133, ; uint32_t type_token_id
		i32 32; uint32_t java_map_index
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 u0x02000134, ; uint32_t type_token_id
		i32 0; uint32_t java_map_index
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 u0x02000135, ; uint32_t type_token_id
		i32 91; uint32_t java_map_index
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 u0x02000136, ; uint32_t type_token_id
		i32 47; uint32_t java_map_index
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 u0x02000137, ; uint32_t type_token_id
		i32 127; uint32_t java_map_index
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 u0x02000138, ; uint32_t type_token_id
		i32 135; uint32_t java_map_index
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 u0x02000139, ; uint32_t type_token_id
		i32 115; uint32_t java_map_index
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 u0x0200013a, ; uint32_t type_token_id
		i32 99; uint32_t java_map_index
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 u0x0200013b, ; uint32_t type_token_id
		i32 114; uint32_t java_map_index
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 u0x0200013c, ; uint32_t type_token_id
		i32 153; uint32_t java_map_index
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 u0x0200013d, ; uint32_t type_token_id
		i32 125; uint32_t java_map_index
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 u0x0200013e, ; uint32_t type_token_id
		i32 88; uint32_t java_map_index
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 u0x0200013f, ; uint32_t type_token_id
		i32 66; uint32_t java_map_index
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 u0x02000140, ; uint32_t type_token_id
		i32 110; uint32_t java_map_index
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 u0x02000142, ; uint32_t type_token_id
		i32 96; uint32_t java_map_index
	}, ; 121
	%struct.TypeMapModuleEntry {
		i32 u0x02000143, ; uint32_t type_token_id
		i32 128; uint32_t java_map_index
	}, ; 122
	%struct.TypeMapModuleEntry {
		i32 u0x02000144, ; uint32_t type_token_id
		i32 95; uint32_t java_map_index
	}, ; 123
	%struct.TypeMapModuleEntry {
		i32 u0x02000145, ; uint32_t type_token_id
		i32 48; uint32_t java_map_index
	}, ; 124
	%struct.TypeMapModuleEntry {
		i32 u0x02000146, ; uint32_t type_token_id
		i32 25; uint32_t java_map_index
	}, ; 125
	%struct.TypeMapModuleEntry {
		i32 u0x02000147, ; uint32_t type_token_id
		i32 86; uint32_t java_map_index
	}, ; 126
	%struct.TypeMapModuleEntry {
		i32 u0x02000149, ; uint32_t type_token_id
		i32 111; uint32_t java_map_index
	}, ; 127
	%struct.TypeMapModuleEntry {
		i32 u0x0200014a, ; uint32_t type_token_id
		i32 36; uint32_t java_map_index
	}, ; 128
	%struct.TypeMapModuleEntry {
		i32 u0x0200014b, ; uint32_t type_token_id
		i32 157; uint32_t java_map_index
	}, ; 129
	%struct.TypeMapModuleEntry {
		i32 u0x0200014c, ; uint32_t type_token_id
		i32 162; uint32_t java_map_index
	}, ; 130
	%struct.TypeMapModuleEntry {
		i32 u0x0200014e, ; uint32_t type_token_id
		i32 55; uint32_t java_map_index
	}, ; 131
	%struct.TypeMapModuleEntry {
		i32 u0x0200014f, ; uint32_t type_token_id
		i32 144; uint32_t java_map_index
	}, ; 132
	%struct.TypeMapModuleEntry {
		i32 u0x02000150, ; uint32_t type_token_id
		i32 104; uint32_t java_map_index
	}, ; 133
	%struct.TypeMapModuleEntry {
		i32 u0x02000151, ; uint32_t type_token_id
		i32 52; uint32_t java_map_index
	}, ; 134
	%struct.TypeMapModuleEntry {
		i32 u0x02000153, ; uint32_t type_token_id
		i32 97; uint32_t java_map_index
	}, ; 135
	%struct.TypeMapModuleEntry {
		i32 u0x02000154, ; uint32_t type_token_id
		i32 72; uint32_t java_map_index
	}, ; 136
	%struct.TypeMapModuleEntry {
		i32 u0x02000155, ; uint32_t type_token_id
		i32 141; uint32_t java_map_index
	}, ; 137
	%struct.TypeMapModuleEntry {
		i32 u0x02000165, ; uint32_t type_token_id
		i32 78; uint32_t java_map_index
	} ; 138
], align 4

@module4_managed_to_java_duplicates = internal dso_local constant [49 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000053, ; uint32_t type_token_id
		i32 11; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000054, ; uint32_t type_token_id
		i32 155; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000056, ; uint32_t type_token_id
		i32 165; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000058, ; uint32_t type_token_id
		i32 53; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200005a, ; uint32_t type_token_id
		i32 51; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200005c, ; uint32_t type_token_id
		i32 33; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000067, ; uint32_t type_token_id
		i32 17; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000071, ; uint32_t type_token_id
		i32 163; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000074, ; uint32_t type_token_id
		i32 50; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000075, ; uint32_t type_token_id
		i32 44; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000077, ; uint32_t type_token_id
		i32 20; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200007c, ; uint32_t type_token_id
		i32 105; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200007e, ; uint32_t type_token_id
		i32 134; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000082, ; uint32_t type_token_id
		i32 136; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x0200008b, ; uint32_t type_token_id
		i32 106; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200008f, ; uint32_t type_token_id
		i32 151; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x0200009a, ; uint32_t type_token_id
		i32 26; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x0200009d, ; uint32_t type_token_id
		i32 68; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200009f, ; uint32_t type_token_id
		i32 43; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x020000a1, ; uint32_t type_token_id
		i32 132; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x020000a3, ; uint32_t type_token_id
		i32 94; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x020000a5, ; uint32_t type_token_id
		i32 129; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x020000a7, ; uint32_t type_token_id
		i32 16; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x020000aa, ; uint32_t type_token_id
		i32 13; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x020000ab, ; uint32_t type_token_id
		i32 10; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x020000ad, ; uint32_t type_token_id
		i32 58; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x020000b2, ; uint32_t type_token_id
		i32 1; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x020000ba, ; uint32_t type_token_id
		i32 40; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x020000bb, ; uint32_t type_token_id
		i32 122; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x020000c1, ; uint32_t type_token_id
		i32 116; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x020000d9, ; uint32_t type_token_id
		i32 131; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x020000df, ; uint32_t type_token_id
		i32 6; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x020000e4, ; uint32_t type_token_id
		i32 81; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x020000e8, ; uint32_t type_token_id
		i32 160; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x020000fc, ; uint32_t type_token_id
		i32 46; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x02000107, ; uint32_t type_token_id
		i32 69; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x02000109, ; uint32_t type_token_id
		i32 140; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x0200010a, ; uint32_t type_token_id
		i32 79; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x02000117, ; uint32_t type_token_id
		i32 100; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x02000121, ; uint32_t type_token_id
		i32 145; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x02000123, ; uint32_t type_token_id
		i32 154; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x02000127, ; uint32_t type_token_id
		i32 89; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x0200012a, ; uint32_t type_token_id
		i32 108; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x0200012c, ; uint32_t type_token_id
		i32 77; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x0200012e, ; uint32_t type_token_id
		i32 143; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x02000130, ; uint32_t type_token_id
		i32 147; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x02000132, ; uint32_t type_token_id
		i32 146; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x0200014d, ; uint32_t type_token_id
		i32 162; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x02000152, ; uint32_t type_token_id
		i32 52; uint32_t java_map_index
	} ; 48
], align 4

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [166 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000134, ; uint32_t type_token_id
		i32 108; uint32_t java_name_index
	}, ; 0
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000b1, ; uint32_t type_token_id
		i32 57; uint32_t java_name_index
	}, ; 1
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 146; uint32_t java_name_index
	}, ; 2
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200006f, ; uint32_t type_token_id
		i32 22; uint32_t java_name_index
	}, ; 3
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200006a, ; uint32_t type_token_id
		i32 18; uint32_t java_name_index
	}, ; 4
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000e5, ; uint32_t type_token_id
		i32 70; uint32_t java_name_index
	}, ; 5
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000da, ; uint32_t type_token_id
		i32 68; uint32_t java_name_index
	}, ; 6
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000121, ; uint32_t type_token_id
		i32 141; uint32_t java_name_index
	}, ; 7
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000101, ; uint32_t type_token_id
		i32 77; uint32_t java_name_index
	}, ; 8
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 145; uint32_t java_name_index
	}, ; 9
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 54; uint32_t java_name_index
	}, ; 10
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000052, ; uint32_t type_token_id
		i32 1; uint32_t java_name_index
	}, ; 11
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 144; uint32_t java_name_index
	}, ; 12
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 55; uint32_t java_name_index
	}, ; 13
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000116, ; uint32_t type_token_id
		i32 92; uint32_t java_name_index
	}, ; 14
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 163; uint32_t java_name_index
	}, ; 15
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 53; uint32_t java_name_index
	}, ; 16
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 15; uint32_t java_name_index
	}, ; 17
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000068, ; uint32_t type_token_id
		i32 16; uint32_t java_name_index
	}, ; 18
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000017, ; uint32_t type_token_id
		i32 153; uint32_t java_name_index
	}, ; 19
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 26; uint32_t java_name_index
	}, ; 20
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200007f, ; uint32_t type_token_id
		i32 31; uint32_t java_name_index
	}, ; 21
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000011, ; uint32_t type_token_id
		i32 149; uint32_t java_name_index
	}, ; 22
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000062, ; uint32_t type_token_id
		i32 11; uint32_t java_name_index
	}, ; 23
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200010c, ; uint32_t type_token_id
		i32 85; uint32_t java_name_index
	}, ; 24
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000146, ; uint32_t type_token_id
		i32 125; uint32_t java_name_index
	}, ; 25
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000099, ; uint32_t type_token_id
		i32 47; uint32_t java_name_index
	}, ; 26
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200005d, ; uint32_t type_token_id
		i32 6; uint32_t java_name_index
	}, ; 27
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000012, ; uint32_t type_token_id
		i32 150; uint32_t java_name_index
	}, ; 28
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000064, ; uint32_t type_token_id
		i32 13; uint32_t java_name_index
	}, ; 29
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000111, ; uint32_t type_token_id
		i32 89; uint32_t java_name_index
	}, ; 30
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000105, ; uint32_t type_token_id
		i32 81; uint32_t java_name_index
	}, ; 31
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000133, ; uint32_t type_token_id
		i32 107; uint32_t java_name_index
	}, ; 32
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 5; uint32_t java_name_index
	}, ; 33
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000114, ; uint32_t type_token_id
		i32 139; uint32_t java_name_index
	}, ; 34
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000013, ; uint32_t type_token_id
		i32 151; uint32_t java_name_index
	}, ; 35
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200014a, ; uint32_t type_token_id
		i32 128; uint32_t java_name_index
	}, ; 36
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000044, ; uint32_t type_token_id
		i32 161; uint32_t java_name_index
	}, ; 37
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000061, ; uint32_t type_token_id
		i32 10; uint32_t java_name_index
	}, ; 38
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000e6, ; uint32_t type_token_id
		i32 71; uint32_t java_name_index
	}, ; 39
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000b8, ; uint32_t type_token_id
		i32 61; uint32_t java_name_index
	}, ; 40
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200007a, ; uint32_t type_token_id
		i32 29; uint32_t java_name_index
	}, ; 41
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000008, ; uint32_t type_token_id
		i32 143; uint32_t java_name_index
	}, ; 42
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 49; uint32_t java_name_index
	}, ; 43
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 24; uint32_t java_name_index
	}, ; 44
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000b3, ; uint32_t type_token_id
		i32 58; uint32_t java_name_index
	}, ; 45
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000fb, ; uint32_t type_token_id
		i32 74; uint32_t java_name_index
	}, ; 46
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000136, ; uint32_t type_token_id
		i32 110; uint32_t java_name_index
	}, ; 47
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000145, ; uint32_t type_token_id
		i32 124; uint32_t java_name_index
	}, ; 48
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 164; uint32_t java_name_index
	}, ; 49
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 25; uint32_t java_name_index
	}, ; 50
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 4; uint32_t java_name_index
	}, ; 51
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000151, ; uint32_t type_token_id
		i32 134; uint32_t java_name_index
	}, ; 52
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000057, ; uint32_t type_token_id
		i32 3; uint32_t java_name_index
	}, ; 53
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000034, ; uint32_t type_token_id
		i32 157; uint32_t java_name_index
	}, ; 54
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200014e, ; uint32_t type_token_id
		i32 131; uint32_t java_name_index
	}, ; 55
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000102, ; uint32_t type_token_id
		i32 78; uint32_t java_name_index
	}, ; 56
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200006c, ; uint32_t type_token_id
		i32 20; uint32_t java_name_index
	}, ; 57
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 56; uint32_t java_name_index
	}, ; 58
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200006e, ; uint32_t type_token_id
		i32 21; uint32_t java_name_index
	}, ; 59
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000080, ; uint32_t type_token_id
		i32 32; uint32_t java_name_index
	}, ; 60
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200011a, ; uint32_t type_token_id
		i32 93; uint32_t java_name_index
	}, ; 61
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000096, ; uint32_t type_token_id
		i32 44; uint32_t java_name_index
	}, ; 62
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000092, ; uint32_t type_token_id
		i32 41; uint32_t java_name_index
	}, ; 63
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000103, ; uint32_t type_token_id
		i32 79; uint32_t java_name_index
	}, ; 64
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200010b, ; uint32_t type_token_id
		i32 84; uint32_t java_name_index
	}, ; 65
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200013f, ; uint32_t type_token_id
		i32 119; uint32_t java_name_index
	}, ; 66
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 155; uint32_t java_name_index
	}, ; 67
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 48; uint32_t java_name_index
	}, ; 68
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000106, ; uint32_t type_token_id
		i32 82; uint32_t java_name_index
	}, ; 69
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000128, ; uint32_t type_token_id
		i32 101; uint32_t java_name_index
	}, ; 70
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000010, ; uint32_t type_token_id
		i32 148; uint32_t java_name_index
	}, ; 71
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000154, ; uint32_t type_token_id
		i32 136; uint32_t java_name_index
	}, ; 72
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000093, ; uint32_t type_token_id
		i32 42; uint32_t java_name_index
	}, ; 73
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000fe, ; uint32_t type_token_id
		i32 75; uint32_t java_name_index
	}, ; 74
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 7; uint32_t java_name_index
	}, ; 75
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000090, ; uint32_t type_token_id
		i32 39; uint32_t java_name_index
	}, ; 76
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 103; uint32_t java_name_index
	}, ; 77
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000165, ; uint32_t type_token_id
		i32 138; uint32_t java_name_index
	}, ; 78
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000104, ; uint32_t type_token_id
		i32 80; uint32_t java_name_index
	}, ; 79
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 159; uint32_t java_name_index
	}, ; 80
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000e3, ; uint32_t type_token_id
		i32 69; uint32_t java_name_index
	}, ; 81
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000098, ; uint32_t type_token_id
		i32 46; uint32_t java_name_index
	}, ; 82
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000079, ; uint32_t type_token_id
		i32 28; uint32_t java_name_index
	}, ; 83
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 152; uint32_t java_name_index
	}, ; 84
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200011f, ; uint32_t type_token_id
		i32 95; uint32_t java_name_index
	}, ; 85
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000147, ; uint32_t type_token_id
		i32 126; uint32_t java_name_index
	}, ; 86
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000b9, ; uint32_t type_token_id
		i32 62; uint32_t java_name_index
	}, ; 87
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200013e, ; uint32_t type_token_id
		i32 118; uint32_t java_name_index
	}, ; 88
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000126, ; uint32_t type_token_id
		i32 100; uint32_t java_name_index
	}, ; 89
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000b4, ; uint32_t type_token_id
		i32 59; uint32_t java_name_index
	}, ; 90
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000135, ; uint32_t type_token_id
		i32 109; uint32_t java_name_index
	}, ; 91
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000113, ; uint32_t type_token_id
		i32 91; uint32_t java_name_index
	}, ; 92
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000f3, ; uint32_t type_token_id
		i32 73; uint32_t java_name_index
	}, ; 93
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 51; uint32_t java_name_index
	}, ; 94
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000144, ; uint32_t type_token_id
		i32 123; uint32_t java_name_index
	}, ; 95
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000142, ; uint32_t type_token_id
		i32 121; uint32_t java_name_index
	}, ; 96
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000153, ; uint32_t type_token_id
		i32 135; uint32_t java_name_index
	}, ; 97
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000118, ; uint32_t type_token_id
		i32 140; uint32_t java_name_index
	}, ; 98
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200013a, ; uint32_t type_token_id
		i32 114; uint32_t java_name_index
	}, ; 99
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000112, ; uint32_t type_token_id
		i32 90; uint32_t java_name_index
	}, ; 100
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000d5, ; uint32_t type_token_id
		i32 66; uint32_t java_name_index
	}, ; 101
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000124, ; uint32_t type_token_id
		i32 98; uint32_t java_name_index
	}, ; 102
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000097, ; uint32_t type_token_id
		i32 45; uint32_t java_name_index
	}, ; 103
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000150, ; uint32_t type_token_id
		i32 133; uint32_t java_name_index
	}, ; 104
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000069, ; uint32_t type_token_id
		i32 17; uint32_t java_name_index
	}, ; 105
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 35; uint32_t java_name_index
	}, ; 106
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000b7, ; uint32_t type_token_id
		i32 60; uint32_t java_name_index
	}, ; 107
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000129, ; uint32_t type_token_id
		i32 102; uint32_t java_name_index
	}, ; 108
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 8; uint32_t java_name_index
	}, ; 109
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000140, ; uint32_t type_token_id
		i32 120; uint32_t java_name_index
	}, ; 110
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000149, ; uint32_t type_token_id
		i32 127; uint32_t java_name_index
	}, ; 111
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000038, ; uint32_t type_token_id
		i32 158; uint32_t java_name_index
	}, ; 112
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000040, ; uint32_t type_token_id
		i32 160; uint32_t java_name_index
	}, ; 113
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200013b, ; uint32_t type_token_id
		i32 115; uint32_t java_name_index
	}, ; 114
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000139, ; uint32_t type_token_id
		i32 113; uint32_t java_name_index
	}, ; 115
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 65; uint32_t java_name_index
	}, ; 116
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200008c, ; uint32_t type_token_id
		i32 36; uint32_t java_name_index
	}, ; 117
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000122, ; uint32_t type_token_id
		i32 142; uint32_t java_name_index
	}, ; 118
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000bd, ; uint32_t type_token_id
		i32 63; uint32_t java_name_index
	}, ; 119
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200010f, ; uint32_t type_token_id
		i32 88; uint32_t java_name_index
	}, ; 120
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000030, ; uint32_t type_token_id
		i32 156; uint32_t java_name_index
	}, ; 121
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000094, ; uint32_t type_token_id
		i32 43; uint32_t java_name_index
	}, ; 122
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200008d, ; uint32_t type_token_id
		i32 37; uint32_t java_name_index
	}, ; 123
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000078, ; uint32_t type_token_id
		i32 27; uint32_t java_name_index
	}, ; 124
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200013d, ; uint32_t type_token_id
		i32 117; uint32_t java_name_index
	}, ; 125
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000100, ; uint32_t type_token_id
		i32 76; uint32_t java_name_index
	}, ; 126
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000137, ; uint32_t type_token_id
		i32 111; uint32_t java_name_index
	}, ; 127
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000143, ; uint32_t type_token_id
		i32 122; uint32_t java_name_index
	}, ; 128
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 52; uint32_t java_name_index
	}, ; 129
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000063, ; uint32_t type_token_id
		i32 12; uint32_t java_name_index
	}, ; 130
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000d8, ; uint32_t type_token_id
		i32 67; uint32_t java_name_index
	}, ; 131
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 50; uint32_t java_name_index
	}, ; 132
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200011b, ; uint32_t type_token_id
		i32 94; uint32_t java_name_index
	}, ; 133
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 30; uint32_t java_name_index
	}, ; 134
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000138, ; uint32_t type_token_id
		i32 112; uint32_t java_name_index
	}, ; 135
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 33; uint32_t java_name_index
	}, ; 136
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000048, ; uint32_t type_token_id
		i32 162; uint32_t java_name_index
	}, ; 137
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200006b, ; uint32_t type_token_id
		i32 19; uint32_t java_name_index
	}, ; 138
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000065, ; uint32_t type_token_id
		i32 14; uint32_t java_name_index
	}, ; 139
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000108, ; uint32_t type_token_id
		i32 83; uint32_t java_name_index
	}, ; 140
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000155, ; uint32_t type_token_id
		i32 137; uint32_t java_name_index
	}, ; 141
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 154; uint32_t java_name_index
	}, ; 142
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 104; uint32_t java_name_index
	}, ; 143
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200014f, ; uint32_t type_token_id
		i32 132; uint32_t java_name_index
	}, ; 144
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000120, ; uint32_t type_token_id
		i32 96; uint32_t java_name_index
	}, ; 145
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 106; uint32_t java_name_index
	}, ; 146
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 105; uint32_t java_name_index
	}, ; 147
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000094, ; uint32_t type_token_id
		i32 165; uint32_t java_name_index
	}, ; 148
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200010d, ; uint32_t type_token_id
		i32 86; uint32_t java_name_index
	}, ; 149
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 147; uint32_t java_name_index
	}, ; 150
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 38; uint32_t java_name_index
	}, ; 151
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200010e, ; uint32_t type_token_id
		i32 87; uint32_t java_name_index
	}, ; 152
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200013c, ; uint32_t type_token_id
		i32 116; uint32_t java_name_index
	}, ; 153
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000122, ; uint32_t type_token_id
		i32 97; uint32_t java_name_index
	}, ; 154
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000051, ; uint32_t type_token_id
		i32 0; uint32_t java_name_index
	}, ; 155
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000125, ; uint32_t type_token_id
		i32 99; uint32_t java_name_index
	}, ; 156
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200014b, ; uint32_t type_token_id
		i32 129; uint32_t java_name_index
	}, ; 157
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000060, ; uint32_t type_token_id
		i32 9; uint32_t java_name_index
	}, ; 158
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000083, ; uint32_t type_token_id
		i32 34; uint32_t java_name_index
	}, ; 159
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000e7, ; uint32_t type_token_id
		i32 72; uint32_t java_name_index
	}, ; 160
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000091, ; uint32_t type_token_id
		i32 40; uint32_t java_name_index
	}, ; 161
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 130; uint32_t java_name_index
	}, ; 162
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 23; uint32_t java_name_index
	}, ; 163
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x020000bf, ; uint32_t type_token_id
		i32 64; uint32_t java_name_index
	}, ; 164
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000055, ; uint32_t type_token_id
		i32 2; uint32_t java_name_index
	} ; 165
], align 4

; Java type names
@java_type_names = dso_local local_unnamed_addr constant [166 x ptr] [
	ptr @.tmr.0, ; 0 ('javax/microedition/khronos/egl/EGLContext')
	ptr @.tmr.1, ; 1 ('javax/microedition/khronos/egl/EGLConfig')
	ptr @.tmr.2, ; 2 ('javax/microedition/khronos/egl/EGLDisplay')
	ptr @.tmr.3, ; 3 ('javax/microedition/khronos/egl/EGLSurface')
	ptr @.tmr.4, ; 4 ('javax/microedition/khronos/egl/EGL')
	ptr @.tmr.5, ; 5 ('javax/microedition/khronos/egl/EGL10')
	ptr @.tmr.6, ; 6 ('android/window/InputTransferToken')
	ptr @.tmr.7, ; 7 ('android/window/TrustedPresentationThresholds')
	ptr @.tmr.8, ; 8 ('android/provider/Settings')
	ptr @.tmr.9, ; 9 ('android/provider/Settings$NameValueTable')
	ptr @.tmr.10, ; 10 ('android/provider/Settings$SettingNotFoundException')
	ptr @.tmr.11, ; 11 ('android/provider/Settings$System')
	ptr @.tmr.12, ; 12 ('android/util/Log')
	ptr @.tmr.13, ; 13 ('android/util/AndroidException')
	ptr @.tmr.14, ; 14 ('android/util/DisplayMetrics')
	ptr @.tmr.15, ; 15 ('android/util/AttributeSet')
	ptr @.tmr.16, ; 16 ('android/os/Handler')
	ptr @.tmr.17, ; 17 ('android/os/Vibrator')
	ptr @.tmr.18, ; 18 ('android/os/BaseBundle')
	ptr @.tmr.19, ; 19 ('android/os/Build')
	ptr @.tmr.20, ; 20 ('android/os/Build$VERSION')
	ptr @.tmr.21, ; 21 ('android/os/Bundle')
	ptr @.tmr.22, ; 22 ('android/os/CancellationSignal')
	ptr @.tmr.23, ; 23 ('android/os/IBinder$DeathRecipient')
	ptr @.tmr.24, ; 24 ('android/os/IBinder')
	ptr @.tmr.25, ; 25 ('android/os/IBinder$FrozenStateChangeCallback')
	ptr @.tmr.26, ; 26 ('android/os/IInterface')
	ptr @.tmr.27, ; 27 ('android/os/Looper')
	ptr @.tmr.28, ; 28 ('android/os/Parcel')
	ptr @.tmr.29, ; 29 ('android/os/Process')
	ptr @.tmr.30, ; 30 ('android/os/VibratorManager')
	ptr @.tmr.31, ; 31 ('android/media/AudioManager')
	ptr @.tmr.32, ; 32 ('android/media/MediaPlayer')
	ptr @.tmr.33, ; 33 ('android/media/MediaPlayer$OnCompletionListener')
	ptr @.tmr.34, ; 34 ('mono/android/media/MediaPlayer_OnCompletionListenerImplementor')
	ptr @.tmr.35, ; 35 ('android/animation/TimeInterpolator')
	ptr @.tmr.36, ; 36 ('android/view/WindowManager$LayoutParams')
	ptr @.tmr.37, ; 37 ('android/view/View')
	ptr @.tmr.38, ; 38 ('android/view/View$OnTouchListener')
	ptr @.tmr.39, ; 39 ('android/view/InputDevice')
	ptr @.tmr.40, ; 40 ('android/view/KeyCharacterMap')
	ptr @.tmr.41, ; 41 ('android/view/KeyEvent')
	ptr @.tmr.42, ; 42 ('android/view/MotionEvent')
	ptr @.tmr.43, ; 43 ('android/view/Window')
	ptr @.tmr.44, ; 44 ('android/view/Choreographer')
	ptr @.tmr.45, ; 45 ('android/view/ContextThemeWrapper')
	ptr @.tmr.46, ; 46 ('android/view/Display')
	ptr @.tmr.47, ; 47 ('android/view/InputEvent')
	ptr @.tmr.48, ; 48 ('android/view/SurfaceControlInputReceiver')
	ptr @.tmr.49, ; 49 ('android/view/SurfaceHolder$Callback')
	ptr @.tmr.50, ; 50 ('android/view/SurfaceHolder')
	ptr @.tmr.51, ; 51 ('android/view/ViewManager')
	ptr @.tmr.52, ; 52 ('android/view/WindowInsetsAnimationController')
	ptr @.tmr.53, ; 53 ('android/view/WindowInsetsAnimationControlListener')
	ptr @.tmr.54, ; 54 ('android/view/WindowInsetsController')
	ptr @.tmr.55, ; 55 ('android/view/WindowInsetsController$OnControllableInsetsChangedListener')
	ptr @.tmr.56, ; 56 ('android/view/WindowManager')
	ptr @.tmr.57, ; 57 ('android/view/OrientationEventListener')
	ptr @.tmr.58, ; 58 ('android/view/Surface')
	ptr @.tmr.59, ; 59 ('android/view/SurfaceControl')
	ptr @.tmr.60, ; 60 ('android/view/SurfaceView')
	ptr @.tmr.61, ; 61 ('android/view/ViewGroup')
	ptr @.tmr.62, ; 62 ('android/view/ViewGroup$LayoutParams')
	ptr @.tmr.63, ; 63 ('android/view/WindowInsets')
	ptr @.tmr.64, ; 64 ('android/view/WindowMetrics')
	ptr @.tmr.65, ; 65 ('android/view/animation/Interpolator')
	ptr @.tmr.66, ; 66 ('mono/android/runtime/InputStreamAdapter')
	ptr @.tmr.67, ; 67 ('java/util/Collection')
	ptr @.tmr.68, ; 68 ('java/util/HashMap')
	ptr @.tmr.69, ; 69 ('java/util/ArrayList')
	ptr @.tmr.70, ; 70 ('mono/android/runtime/JavaObject')
	ptr @.tmr.71, ; 71 ('android/runtime/JavaProxyThrowable')
	ptr @.tmr.72, ; 72 ('java/util/HashSet')
	ptr @.tmr.73, ; 73 ('mono/android/runtime/OutputStreamAdapter')
	ptr @.tmr.74, ; 74 ('android/net/Uri')
	ptr @.tmr.75, ; 75 ('android/graphics/Canvas')
	ptr @.tmr.76, ; 76 ('android/graphics/Insets')
	ptr @.tmr.77, ; 77 ('android/graphics/Path')
	ptr @.tmr.78, ; 78 ('android/graphics/Point')
	ptr @.tmr.79, ; 79 ('android/graphics/Rect')
	ptr @.tmr.80, ; 80 ('android/content/Context')
	ptr @.tmr.81, ; 81 ('android/content/Intent')
	ptr @.tmr.82, ; 82 ('android/content/BroadcastReceiver')
	ptr @.tmr.83, ; 83 ('android/content/ContentResolver')
	ptr @.tmr.84, ; 84 ('android/content/ContextWrapper')
	ptr @.tmr.85, ; 85 ('android/content/IntentFilter')
	ptr @.tmr.86, ; 86 ('android/content/res/AssetFileDescriptor')
	ptr @.tmr.87, ; 87 ('android/content/res/AssetManager')
	ptr @.tmr.88, ; 88 ('android/content/res/Configuration')
	ptr @.tmr.89, ; 89 ('android/content/res/Resources')
	ptr @.tmr.90, ; 90 ('android/content/pm/PackageManager')
	ptr @.tmr.91, ; 91 ('android/content/pm/ApplicationInfo')
	ptr @.tmr.92, ; 92 ('android/content/pm/PackageItemInfo')
	ptr @.tmr.93, ; 93 ('android/app/Activity')
	ptr @.tmr.94, ; 94 ('android/app/Application')
	ptr @.tmr.95, ; 95 ('android/app/KeyguardManager')
	ptr @.tmr.96, ; 96 ('java/nio/channels/FileChannel')
	ptr @.tmr.97, ; 97 ('java/nio/channels/spi/AbstractInterruptibleChannel')
	ptr @.tmr.98, ; 98 ('java/io/FileDescriptor')
	ptr @.tmr.99, ; 99 ('java/io/FileInputStream')
	ptr @.tmr.100, ; 100 ('java/io/InputStream')
	ptr @.tmr.101, ; 101 ('java/io/IOException')
	ptr @.tmr.102, ; 102 ('java/io/OutputStream')
	ptr @.tmr.103, ; 103 ('java/util/Iterator')
	ptr @.tmr.104, ; 104 ('java/util/function/Consumer')
	ptr @.tmr.105, ; 105 ('java/util/function/IntConsumer')
	ptr @.tmr.106, ; 106 ('java/util/concurrent/Executor')
	ptr @.tmr.107, ; 107 ('java/lang/Boolean')
	ptr @.tmr.108, ; 108 ('java/lang/Byte')
	ptr @.tmr.109, ; 109 ('java/lang/Character')
	ptr @.tmr.110, ; 110 ('java/lang/Class')
	ptr @.tmr.111, ; 111 ('java/lang/ClassNotFoundException')
	ptr @.tmr.112, ; 112 ('java/lang/Double')
	ptr @.tmr.113, ; 113 ('java/lang/Exception')
	ptr @.tmr.114, ; 114 ('java/lang/Float')
	ptr @.tmr.115, ; 115 ('java/lang/Integer')
	ptr @.tmr.116, ; 116 ('java/lang/Long')
	ptr @.tmr.117, ; 117 ('java/lang/Object')
	ptr @.tmr.118, ; 118 ('java/lang/RuntimeException')
	ptr @.tmr.119, ; 119 ('java/lang/Short')
	ptr @.tmr.120, ; 120 ('java/lang/String')
	ptr @.tmr.121, ; 121 ('java/lang/Thread')
	ptr @.tmr.122, ; 122 ('mono/java/lang/RunnableImplementor')
	ptr @.tmr.123, ; 123 ('java/lang/Throwable')
	ptr @.tmr.124, ; 124 ('java/lang/ClassCastException')
	ptr @.tmr.125, ; 125 ('java/lang/Error')
	ptr @.tmr.126, ; 126 ('java/lang/CharSequence')
	ptr @.tmr.127, ; 127 ('java/lang/IllegalArgumentException')
	ptr @.tmr.128, ; 128 ('java/lang/IllegalStateException')
	ptr @.tmr.129, ; 129 ('java/lang/IndexOutOfBoundsException')
	ptr @.tmr.130, ; 130 ('java/lang/Runnable')
	ptr @.tmr.131, ; 131 ('java/lang/LinkageError')
	ptr @.tmr.132, ; 132 ('java/lang/NoClassDefFoundError')
	ptr @.tmr.133, ; 133 ('java/lang/NullPointerException')
	ptr @.tmr.134, ; 134 ('java/lang/Number')
	ptr @.tmr.135, ; 135 ('java/lang/ReflectiveOperationException')
	ptr @.tmr.136, ; 136 ('java/lang/StackTraceElement')
	ptr @.tmr.137, ; 137 ('java/lang/UnsupportedOperationException')
	ptr @.tmr.138, ; 138 ('mono/android/TypeManager')
	ptr @.tmr.139, ; 139 ('crc64493ac3851fab1842/AndroidGameActivity')
	ptr @.tmr.140, ; 140 ('crc64493ac3851fab1842/MonoGameAndroidGameView')
	ptr @.tmr.141, ; 141 ('crc64493ac3851fab1842/OrientationListener')
	ptr @.tmr.142, ; 142 ('crc64493ac3851fab1842/ScreenReceiver')
	ptr @.tmr.143, ; 143 ('crc64158d7576b92bf39c/Main')
	ptr @.tmr.144, ; 144 ('androidx/core/graphics/Insets')
	ptr @.tmr.145, ; 145 ('androidx/core/view/DisplayCutoutCompat')
	ptr @.tmr.146, ; 146 ('androidx/core/view/WindowInsetsAnimationControlListenerCompat')
	ptr @.tmr.147, ; 147 ('androidx/core/view/WindowCompat')
	ptr @.tmr.148, ; 148 ('androidx/core/view/WindowInsetsAnimationControllerCompat')
	ptr @.tmr.149, ; 149 ('androidx/core/view/WindowInsetsCompat')
	ptr @.tmr.150, ; 150 ('androidx/core/view/WindowInsetsCompat$Type')
	ptr @.tmr.151, ; 151 ('androidx/core/view/WindowInsetsControllerCompat')
	ptr @.tmr.152, ; 152 ('androidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener')
	ptr @.tmr.153, ; 153 ('mono/androidx/core/view/WindowInsetsControllerCompat_OnControllableInsetsChangedListenerImplementor')
	ptr @.tmr.154, ; 154 ('[Ljava/lang/Object;')
	ptr @.tmr.155, ; 155 ('[Z')
	ptr @.tmr.156, ; 156 ('[B')
	ptr @.tmr.157, ; 157 ('[C')
	ptr @.tmr.158, ; 158 ('[S')
	ptr @.tmr.159, ; 159 ('[I')
	ptr @.tmr.160, ; 160 ('[J')
	ptr @.tmr.161, ; 161 ('[F')
	ptr @.tmr.162, ; 162 ('[D')
	ptr @.tmr.163, ; 163 ('net/dot/jni/internal/JavaProxyObject')
	ptr @.tmr.164, ; 164 ('net/dot/jni/internal/JavaProxyThrowable')
	ptr @.tmr.165 ; 165 ('net/dot/jni/ManagedPeer')
], align 8

; Strings
@.tmr.0 = private unnamed_addr constant [42 x i8] c"javax/microedition/khronos/egl/EGLContext\00", align 1
@.tmr.1 = private unnamed_addr constant [41 x i8] c"javax/microedition/khronos/egl/EGLConfig\00", align 1
@.tmr.2 = private unnamed_addr constant [42 x i8] c"javax/microedition/khronos/egl/EGLDisplay\00", align 1
@.tmr.3 = private unnamed_addr constant [42 x i8] c"javax/microedition/khronos/egl/EGLSurface\00", align 1
@.tmr.4 = private unnamed_addr constant [35 x i8] c"javax/microedition/khronos/egl/EGL\00", align 1
@.tmr.5 = private unnamed_addr constant [37 x i8] c"javax/microedition/khronos/egl/EGL10\00", align 1
@.tmr.6 = private unnamed_addr constant [34 x i8] c"android/window/InputTransferToken\00", align 1
@.tmr.7 = private unnamed_addr constant [45 x i8] c"android/window/TrustedPresentationThresholds\00", align 1
@.tmr.8 = private unnamed_addr constant [26 x i8] c"android/provider/Settings\00", align 1
@.tmr.9 = private unnamed_addr constant [41 x i8] c"android/provider/Settings$NameValueTable\00", align 1
@.tmr.10 = private unnamed_addr constant [51 x i8] c"android/provider/Settings$SettingNotFoundException\00", align 1
@.tmr.11 = private unnamed_addr constant [33 x i8] c"android/provider/Settings$System\00", align 1
@.tmr.12 = private unnamed_addr constant [17 x i8] c"android/util/Log\00", align 1
@.tmr.13 = private unnamed_addr constant [30 x i8] c"android/util/AndroidException\00", align 1
@.tmr.14 = private unnamed_addr constant [28 x i8] c"android/util/DisplayMetrics\00", align 1
@.tmr.15 = private unnamed_addr constant [26 x i8] c"android/util/AttributeSet\00", align 1
@.tmr.16 = private unnamed_addr constant [19 x i8] c"android/os/Handler\00", align 1
@.tmr.17 = private unnamed_addr constant [20 x i8] c"android/os/Vibrator\00", align 1
@.tmr.18 = private unnamed_addr constant [22 x i8] c"android/os/BaseBundle\00", align 1
@.tmr.19 = private unnamed_addr constant [17 x i8] c"android/os/Build\00", align 1
@.tmr.20 = private unnamed_addr constant [25 x i8] c"android/os/Build$VERSION\00", align 1
@.tmr.21 = private unnamed_addr constant [18 x i8] c"android/os/Bundle\00", align 1
@.tmr.22 = private unnamed_addr constant [30 x i8] c"android/os/CancellationSignal\00", align 1
@.tmr.23 = private unnamed_addr constant [34 x i8] c"android/os/IBinder$DeathRecipient\00", align 1
@.tmr.24 = private unnamed_addr constant [19 x i8] c"android/os/IBinder\00", align 1
@.tmr.25 = private unnamed_addr constant [45 x i8] c"android/os/IBinder$FrozenStateChangeCallback\00", align 1
@.tmr.26 = private unnamed_addr constant [22 x i8] c"android/os/IInterface\00", align 1
@.tmr.27 = private unnamed_addr constant [18 x i8] c"android/os/Looper\00", align 1
@.tmr.28 = private unnamed_addr constant [18 x i8] c"android/os/Parcel\00", align 1
@.tmr.29 = private unnamed_addr constant [19 x i8] c"android/os/Process\00", align 1
@.tmr.30 = private unnamed_addr constant [27 x i8] c"android/os/VibratorManager\00", align 1
@.tmr.31 = private unnamed_addr constant [27 x i8] c"android/media/AudioManager\00", align 1
@.tmr.32 = private unnamed_addr constant [26 x i8] c"android/media/MediaPlayer\00", align 1
@.tmr.33 = private unnamed_addr constant [47 x i8] c"android/media/MediaPlayer$OnCompletionListener\00", align 1
@.tmr.34 = private unnamed_addr constant [63 x i8] c"mono/android/media/MediaPlayer_OnCompletionListenerImplementor\00", align 1
@.tmr.35 = private unnamed_addr constant [35 x i8] c"android/animation/TimeInterpolator\00", align 1
@.tmr.36 = private unnamed_addr constant [40 x i8] c"android/view/WindowManager$LayoutParams\00", align 1
@.tmr.37 = private unnamed_addr constant [18 x i8] c"android/view/View\00", align 1
@.tmr.38 = private unnamed_addr constant [34 x i8] c"android/view/View$OnTouchListener\00", align 1
@.tmr.39 = private unnamed_addr constant [25 x i8] c"android/view/InputDevice\00", align 1
@.tmr.40 = private unnamed_addr constant [29 x i8] c"android/view/KeyCharacterMap\00", align 1
@.tmr.41 = private unnamed_addr constant [22 x i8] c"android/view/KeyEvent\00", align 1
@.tmr.42 = private unnamed_addr constant [25 x i8] c"android/view/MotionEvent\00", align 1
@.tmr.43 = private unnamed_addr constant [20 x i8] c"android/view/Window\00", align 1
@.tmr.44 = private unnamed_addr constant [27 x i8] c"android/view/Choreographer\00", align 1
@.tmr.45 = private unnamed_addr constant [33 x i8] c"android/view/ContextThemeWrapper\00", align 1
@.tmr.46 = private unnamed_addr constant [21 x i8] c"android/view/Display\00", align 1
@.tmr.47 = private unnamed_addr constant [24 x i8] c"android/view/InputEvent\00", align 1
@.tmr.48 = private unnamed_addr constant [41 x i8] c"android/view/SurfaceControlInputReceiver\00", align 1
@.tmr.49 = private unnamed_addr constant [36 x i8] c"android/view/SurfaceHolder$Callback\00", align 1
@.tmr.50 = private unnamed_addr constant [27 x i8] c"android/view/SurfaceHolder\00", align 1
@.tmr.51 = private unnamed_addr constant [25 x i8] c"android/view/ViewManager\00", align 1
@.tmr.52 = private unnamed_addr constant [45 x i8] c"android/view/WindowInsetsAnimationController\00", align 1
@.tmr.53 = private unnamed_addr constant [50 x i8] c"android/view/WindowInsetsAnimationControlListener\00", align 1
@.tmr.54 = private unnamed_addr constant [36 x i8] c"android/view/WindowInsetsController\00", align 1
@.tmr.55 = private unnamed_addr constant [72 x i8] c"android/view/WindowInsetsController$OnControllableInsetsChangedListener\00", align 1
@.tmr.56 = private unnamed_addr constant [27 x i8] c"android/view/WindowManager\00", align 1
@.tmr.57 = private unnamed_addr constant [38 x i8] c"android/view/OrientationEventListener\00", align 1
@.tmr.58 = private unnamed_addr constant [21 x i8] c"android/view/Surface\00", align 1
@.tmr.59 = private unnamed_addr constant [28 x i8] c"android/view/SurfaceControl\00", align 1
@.tmr.60 = private unnamed_addr constant [25 x i8] c"android/view/SurfaceView\00", align 1
@.tmr.61 = private unnamed_addr constant [23 x i8] c"android/view/ViewGroup\00", align 1
@.tmr.62 = private unnamed_addr constant [36 x i8] c"android/view/ViewGroup$LayoutParams\00", align 1
@.tmr.63 = private unnamed_addr constant [26 x i8] c"android/view/WindowInsets\00", align 1
@.tmr.64 = private unnamed_addr constant [27 x i8] c"android/view/WindowMetrics\00", align 1
@.tmr.65 = private unnamed_addr constant [36 x i8] c"android/view/animation/Interpolator\00", align 1
@.tmr.66 = private unnamed_addr constant [40 x i8] c"mono/android/runtime/InputStreamAdapter\00", align 1
@.tmr.67 = private unnamed_addr constant [21 x i8] c"java/util/Collection\00", align 1
@.tmr.68 = private unnamed_addr constant [18 x i8] c"java/util/HashMap\00", align 1
@.tmr.69 = private unnamed_addr constant [20 x i8] c"java/util/ArrayList\00", align 1
@.tmr.70 = private unnamed_addr constant [32 x i8] c"mono/android/runtime/JavaObject\00", align 1
@.tmr.71 = private unnamed_addr constant [35 x i8] c"android/runtime/JavaProxyThrowable\00", align 1
@.tmr.72 = private unnamed_addr constant [18 x i8] c"java/util/HashSet\00", align 1
@.tmr.73 = private unnamed_addr constant [41 x i8] c"mono/android/runtime/OutputStreamAdapter\00", align 1
@.tmr.74 = private unnamed_addr constant [16 x i8] c"android/net/Uri\00", align 1
@.tmr.75 = private unnamed_addr constant [24 x i8] c"android/graphics/Canvas\00", align 1
@.tmr.76 = private unnamed_addr constant [24 x i8] c"android/graphics/Insets\00", align 1
@.tmr.77 = private unnamed_addr constant [22 x i8] c"android/graphics/Path\00", align 1
@.tmr.78 = private unnamed_addr constant [23 x i8] c"android/graphics/Point\00", align 1
@.tmr.79 = private unnamed_addr constant [22 x i8] c"android/graphics/Rect\00", align 1
@.tmr.80 = private unnamed_addr constant [24 x i8] c"android/content/Context\00", align 1
@.tmr.81 = private unnamed_addr constant [23 x i8] c"android/content/Intent\00", align 1
@.tmr.82 = private unnamed_addr constant [34 x i8] c"android/content/BroadcastReceiver\00", align 1
@.tmr.83 = private unnamed_addr constant [32 x i8] c"android/content/ContentResolver\00", align 1
@.tmr.84 = private unnamed_addr constant [31 x i8] c"android/content/ContextWrapper\00", align 1
@.tmr.85 = private unnamed_addr constant [29 x i8] c"android/content/IntentFilter\00", align 1
@.tmr.86 = private unnamed_addr constant [40 x i8] c"android/content/res/AssetFileDescriptor\00", align 1
@.tmr.87 = private unnamed_addr constant [33 x i8] c"android/content/res/AssetManager\00", align 1
@.tmr.88 = private unnamed_addr constant [34 x i8] c"android/content/res/Configuration\00", align 1
@.tmr.89 = private unnamed_addr constant [30 x i8] c"android/content/res/Resources\00", align 1
@.tmr.90 = private unnamed_addr constant [34 x i8] c"android/content/pm/PackageManager\00", align 1
@.tmr.91 = private unnamed_addr constant [35 x i8] c"android/content/pm/ApplicationInfo\00", align 1
@.tmr.92 = private unnamed_addr constant [35 x i8] c"android/content/pm/PackageItemInfo\00", align 1
@.tmr.93 = private unnamed_addr constant [21 x i8] c"android/app/Activity\00", align 1
@.tmr.94 = private unnamed_addr constant [24 x i8] c"android/app/Application\00", align 1
@.tmr.95 = private unnamed_addr constant [28 x i8] c"android/app/KeyguardManager\00", align 1
@.tmr.96 = private unnamed_addr constant [30 x i8] c"java/nio/channels/FileChannel\00", align 1
@.tmr.97 = private unnamed_addr constant [51 x i8] c"java/nio/channels/spi/AbstractInterruptibleChannel\00", align 1
@.tmr.98 = private unnamed_addr constant [23 x i8] c"java/io/FileDescriptor\00", align 1
@.tmr.99 = private unnamed_addr constant [24 x i8] c"java/io/FileInputStream\00", align 1
@.tmr.100 = private unnamed_addr constant [20 x i8] c"java/io/InputStream\00", align 1
@.tmr.101 = private unnamed_addr constant [20 x i8] c"java/io/IOException\00", align 1
@.tmr.102 = private unnamed_addr constant [21 x i8] c"java/io/OutputStream\00", align 1
@.tmr.103 = private unnamed_addr constant [19 x i8] c"java/util/Iterator\00", align 1
@.tmr.104 = private unnamed_addr constant [28 x i8] c"java/util/function/Consumer\00", align 1
@.tmr.105 = private unnamed_addr constant [31 x i8] c"java/util/function/IntConsumer\00", align 1
@.tmr.106 = private unnamed_addr constant [30 x i8] c"java/util/concurrent/Executor\00", align 1
@.tmr.107 = private unnamed_addr constant [18 x i8] c"java/lang/Boolean\00", align 1
@.tmr.108 = private unnamed_addr constant [15 x i8] c"java/lang/Byte\00", align 1
@.tmr.109 = private unnamed_addr constant [20 x i8] c"java/lang/Character\00", align 1
@.tmr.110 = private unnamed_addr constant [16 x i8] c"java/lang/Class\00", align 1
@.tmr.111 = private unnamed_addr constant [33 x i8] c"java/lang/ClassNotFoundException\00", align 1
@.tmr.112 = private unnamed_addr constant [17 x i8] c"java/lang/Double\00", align 1
@.tmr.113 = private unnamed_addr constant [20 x i8] c"java/lang/Exception\00", align 1
@.tmr.114 = private unnamed_addr constant [16 x i8] c"java/lang/Float\00", align 1
@.tmr.115 = private unnamed_addr constant [18 x i8] c"java/lang/Integer\00", align 1
@.tmr.116 = private unnamed_addr constant [15 x i8] c"java/lang/Long\00", align 1
@.tmr.117 = private unnamed_addr constant [17 x i8] c"java/lang/Object\00", align 1
@.tmr.118 = private unnamed_addr constant [27 x i8] c"java/lang/RuntimeException\00", align 1
@.tmr.119 = private unnamed_addr constant [16 x i8] c"java/lang/Short\00", align 1
@.tmr.120 = private unnamed_addr constant [17 x i8] c"java/lang/String\00", align 1
@.tmr.121 = private unnamed_addr constant [17 x i8] c"java/lang/Thread\00", align 1
@.tmr.122 = private unnamed_addr constant [35 x i8] c"mono/java/lang/RunnableImplementor\00", align 1
@.tmr.123 = private unnamed_addr constant [20 x i8] c"java/lang/Throwable\00", align 1
@.tmr.124 = private unnamed_addr constant [29 x i8] c"java/lang/ClassCastException\00", align 1
@.tmr.125 = private unnamed_addr constant [16 x i8] c"java/lang/Error\00", align 1
@.tmr.126 = private unnamed_addr constant [23 x i8] c"java/lang/CharSequence\00", align 1
@.tmr.127 = private unnamed_addr constant [35 x i8] c"java/lang/IllegalArgumentException\00", align 1
@.tmr.128 = private unnamed_addr constant [32 x i8] c"java/lang/IllegalStateException\00", align 1
@.tmr.129 = private unnamed_addr constant [36 x i8] c"java/lang/IndexOutOfBoundsException\00", align 1
@.tmr.130 = private unnamed_addr constant [19 x i8] c"java/lang/Runnable\00", align 1
@.tmr.131 = private unnamed_addr constant [23 x i8] c"java/lang/LinkageError\00", align 1
@.tmr.132 = private unnamed_addr constant [31 x i8] c"java/lang/NoClassDefFoundError\00", align 1
@.tmr.133 = private unnamed_addr constant [31 x i8] c"java/lang/NullPointerException\00", align 1
@.tmr.134 = private unnamed_addr constant [17 x i8] c"java/lang/Number\00", align 1
@.tmr.135 = private unnamed_addr constant [39 x i8] c"java/lang/ReflectiveOperationException\00", align 1
@.tmr.136 = private unnamed_addr constant [28 x i8] c"java/lang/StackTraceElement\00", align 1
@.tmr.137 = private unnamed_addr constant [40 x i8] c"java/lang/UnsupportedOperationException\00", align 1
@.tmr.138 = private unnamed_addr constant [25 x i8] c"mono/android/TypeManager\00", align 1
@.tmr.139 = private unnamed_addr constant [42 x i8] c"crc64493ac3851fab1842/AndroidGameActivity\00", align 1
@.tmr.140 = private unnamed_addr constant [46 x i8] c"crc64493ac3851fab1842/MonoGameAndroidGameView\00", align 1
@.tmr.141 = private unnamed_addr constant [42 x i8] c"crc64493ac3851fab1842/OrientationListener\00", align 1
@.tmr.142 = private unnamed_addr constant [37 x i8] c"crc64493ac3851fab1842/ScreenReceiver\00", align 1
@.tmr.143 = private unnamed_addr constant [27 x i8] c"crc64158d7576b92bf39c/Main\00", align 1
@.tmr.144 = private unnamed_addr constant [30 x i8] c"androidx/core/graphics/Insets\00", align 1
@.tmr.145 = private unnamed_addr constant [39 x i8] c"androidx/core/view/DisplayCutoutCompat\00", align 1
@.tmr.146 = private unnamed_addr constant [62 x i8] c"androidx/core/view/WindowInsetsAnimationControlListenerCompat\00", align 1
@.tmr.147 = private unnamed_addr constant [32 x i8] c"androidx/core/view/WindowCompat\00", align 1
@.tmr.148 = private unnamed_addr constant [57 x i8] c"androidx/core/view/WindowInsetsAnimationControllerCompat\00", align 1
@.tmr.149 = private unnamed_addr constant [38 x i8] c"androidx/core/view/WindowInsetsCompat\00", align 1
@.tmr.150 = private unnamed_addr constant [43 x i8] c"androidx/core/view/WindowInsetsCompat$Type\00", align 1
@.tmr.151 = private unnamed_addr constant [48 x i8] c"androidx/core/view/WindowInsetsControllerCompat\00", align 1
@.tmr.152 = private unnamed_addr constant [84 x i8] c"androidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener\00", align 1
@.tmr.153 = private unnamed_addr constant [100 x i8] c"mono/androidx/core/view/WindowInsetsControllerCompat_OnControllableInsetsChangedListenerImplementor\00", align 1
@.tmr.154 = private unnamed_addr constant [20 x i8] c"[Ljava/lang/Object;\00", align 1
@.tmr.155 = private unnamed_addr constant [3 x i8] c"[Z\00", align 1
@.tmr.156 = private unnamed_addr constant [3 x i8] c"[B\00", align 1
@.tmr.157 = private unnamed_addr constant [3 x i8] c"[C\00", align 1
@.tmr.158 = private unnamed_addr constant [3 x i8] c"[S\00", align 1
@.tmr.159 = private unnamed_addr constant [3 x i8] c"[I\00", align 1
@.tmr.160 = private unnamed_addr constant [3 x i8] c"[J\00", align 1
@.tmr.161 = private unnamed_addr constant [3 x i8] c"[F\00", align 1
@.tmr.162 = private unnamed_addr constant [3 x i8] c"[D\00", align 1
@.tmr.163 = private unnamed_addr constant [37 x i8] c"net/dot/jni/internal/JavaProxyObject\00", align 1
@.tmr.164 = private unnamed_addr constant [40 x i8] c"net/dot/jni/internal/JavaProxyThrowable\00", align 1
@.tmr.165 = private unnamed_addr constant [24 x i8] c"net/dot/jni/ManagedPeer\00", align 1

;TypeMapModule
@.TypeMapModule.0_assembly_name = private unnamed_addr constant [19 x i8] c"MonoGame.Framework\00", align 1
@.TypeMapModule.1_assembly_name = private unnamed_addr constant [15 x i8] c"BattleMushroom\00", align 1
@.TypeMapModule.2_assembly_name = private unnamed_addr constant [22 x i8] c"Xamarin.AndroidX.Core\00", align 1
@.TypeMapModule.3_assembly_name = private unnamed_addr constant [13 x i8] c"Java.Interop\00", align 1
@.TypeMapModule.4_assembly_name = private unnamed_addr constant [13 x i8] c"Mono.Android\00", align 1

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
