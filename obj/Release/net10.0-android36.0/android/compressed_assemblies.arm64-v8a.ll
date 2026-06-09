; ModuleID = 'compressed_assemblies.arm64-v8a.ll'
source_filename = "compressed_assemblies.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.CompressedAssemblyDescriptor = type {
	i32, ; uint32_t uncompressed_file_size
	i1, ; bool loaded
	i32 ; uint32_t buffer_offset
}

@compressed_assembly_count = dso_local local_unnamed_addr constant i32 22, align 4

@compressed_assembly_descriptors = dso_local local_unnamed_addr global [22 x %struct.CompressedAssemblyDescriptor] [
	%struct.CompressedAssemblyDescriptor {
		i32 2560, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 0; uint32_t buffer_offset
	}, ; 0: _Microsoft.Android.Resource.Designer
	%struct.CompressedAssemblyDescriptor {
		i32 567808, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2560; uint32_t buffer_offset
	}, ; 1: MonoGame.Framework
	%struct.CompressedAssemblyDescriptor {
		i32 59904, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 570368; uint32_t buffer_offset
	}, ; 2: Xamarin.AndroidX.Core
	%struct.CompressedAssemblyDescriptor {
		i32 83456, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 630272; uint32_t buffer_offset
	}, ; 3: BattleMushroom
	%struct.CompressedAssemblyDescriptor {
		i32 17920, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 713728; uint32_t buffer_offset
	}, ; 4: System.Collections.Concurrent
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 731648; uint32_t buffer_offset
	}, ; 5: System.Collections
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 739840; uint32_t buffer_offset
	}, ; 6: System.ComponentModel.TypeConverter
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 745472; uint32_t buffer_offset
	}, ; 7: System.ComponentModel
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 750592; uint32_t buffer_offset
	}, ; 8: System.Console
	%struct.CompressedAssemblyDescriptor {
		i32 6656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 762880; uint32_t buffer_offset
	}, ; 9: System.Drawing.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 769536; uint32_t buffer_offset
	}, ; 10: System.Drawing
	%struct.CompressedAssemblyDescriptor {
		i32 17408, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 774656; uint32_t buffer_offset
	}, ; 11: System.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 792064; uint32_t buffer_offset
	}, ; 12: System.ObjectModel
	%struct.CompressedAssemblyDescriptor {
		i32 67072, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 798208; uint32_t buffer_offset
	}, ; 13: System.Private.Uri
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 865280; uint32_t buffer_offset
	}, ; 14: System.Runtime.InteropServices
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 874496; uint32_t buffer_offset
	}, ; 15: System.Runtime.Serialization.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 880128; uint32_t buffer_offset
	}, ; 16: System.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 149504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 887296; uint32_t buffer_offset
	}, ; 17: System.Text.RegularExpressions
	%struct.CompressedAssemblyDescriptor {
		i32 1540096, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1036800; uint32_t buffer_offset
	}, ; 18: System.Private.CoreLib
	%struct.CompressedAssemblyDescriptor {
		i32 163328, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2576896; uint32_t buffer_offset
	}, ; 19: Java.Interop
	%struct.CompressedAssemblyDescriptor {
		i32 22560, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2740224; uint32_t buffer_offset
	}, ; 20: Mono.Android.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 550912, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2762784; uint32_t buffer_offset
	} ; 21: Mono.Android
], align 4

@uncompressed_assemblies_data_size = dso_local local_unnamed_addr constant i32 3313696, align 4

@uncompressed_assemblies_data_buffer = dso_local local_unnamed_addr global [3313696 x i8] zeroinitializer, align 1

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
