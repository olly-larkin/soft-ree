; ModuleID = '/tmp/experiments/get_sign/get_sign.bc'
source_filename = "/tmp/klee_src/examples/get_sign/get_sign.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1 ; [#uses=1 type=[2 x i8]*]

; [#uses=1]
; Function Attrs: noinline nounwind uwtable
define dso_local i32 @get_sign(i32) #0 !dbg !7 {
  %2 = alloca i32, align 4                        ; [#uses=4 type=i32*]
  %3 = alloca i32, align 4                        ; [#uses=3 type=i32*]
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !12, metadata !DIExpression()), !dbg !13 ; [debug line = 7:18] [debug variable = x]
  %4 = load i32, i32* %3, align 4, !dbg !14       ; [#uses=1 type=i32] [debug line = 8:7]
  %5 = icmp eq i32 %4, 0, !dbg !16                ; [#uses=1 type=i1] [debug line = 8:9]
  br i1 %5, label %6, label %7, !dbg !17          ; [debug line = 8:7]

6:                                                ; preds = %1
  store i32 0, i32* %2, align 4, !dbg !18         ; [debug line = 9:6]
  br label %12, !dbg !18                          ; [debug line = 9:6]

7:                                                ; preds = %1
  %8 = load i32, i32* %3, align 4, !dbg !19       ; [#uses=1 type=i32] [debug line = 11:7]
  %9 = icmp slt i32 %8, 0, !dbg !21               ; [#uses=1 type=i1] [debug line = 11:9]
  br i1 %9, label %10, label %11, !dbg !22        ; [debug line = 11:7]

10:                                               ; preds = %7
  store i32 -1, i32* %2, align 4, !dbg !23        ; [debug line = 12:6]
  br label %12, !dbg !23                          ; [debug line = 12:6]

11:                                               ; preds = %7
  store i32 1, i32* %2, align 4, !dbg !24         ; [debug line = 14:6]
  br label %12, !dbg !24                          ; [debug line = 14:6]

12:                                               ; preds = %11, %10, %6
  %13 = load i32, i32* %2, align 4, !dbg !25      ; [#uses=1 type=i32] [debug line = 15:1]
  ret i32 %13, !dbg !25                           ; [debug line = 15:1]
}

; [#uses=2]
; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; [#uses=0]
; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !26 {
  %1 = alloca i32, align 4                        ; [#uses=1 type=i32*]
  %2 = alloca i32, align 4                        ; [#uses=2 type=i32*]
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !29, metadata !DIExpression()), !dbg !30 ; [debug line = 18:7] [debug variable = a]
  %3 = bitcast i32* %2 to i8*, !dbg !31           ; [#uses=1 type=i8*] [debug line = 19:22]
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !32 ; [debug line = 19:3]
  %4 = load i32, i32* %2, align 4, !dbg !33       ; [#uses=1 type=i32] [debug line = 20:19]
  %5 = call i32 @get_sign(i32 %4), !dbg !34       ; [#uses=1 type=i32] [debug line = 20:10]
  ret i32 %5, !dbg !35                            ; [debug line = 20:3]
}

; [#uses=1]
declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "/tmp/klee_src/examples/get_sign/get_sign.c", directory: "/homes/oll16")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
!7 = distinct !DISubprogram(name: "get_sign", scope: !8, file: !8, line: 7, type: !9, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "/tmp/klee_src/examples/get_sign/get_sign.c", directory: "")
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !8, line: 7, type: !11)
!13 = !DILocation(line: 7, column: 18, scope: !7)
!14 = !DILocation(line: 8, column: 7, scope: !15)
!15 = distinct !DILexicalBlock(scope: !7, file: !8, line: 8, column: 7)
!16 = !DILocation(line: 8, column: 9, scope: !15)
!17 = !DILocation(line: 8, column: 7, scope: !7)
!18 = !DILocation(line: 9, column: 6, scope: !15)
!19 = !DILocation(line: 11, column: 7, scope: !20)
!20 = distinct !DILexicalBlock(scope: !7, file: !8, line: 11, column: 7)
!21 = !DILocation(line: 11, column: 9, scope: !20)
!22 = !DILocation(line: 11, column: 7, scope: !7)
!23 = !DILocation(line: 12, column: 6, scope: !20)
!24 = !DILocation(line: 14, column: 6, scope: !20)
!25 = !DILocation(line: 15, column: 1, scope: !7)
!26 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 17, type: !27, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{!11}
!29 = !DILocalVariable(name: "a", scope: !26, file: !8, line: 18, type: !11)
!30 = !DILocation(line: 18, column: 7, scope: !26)
!31 = !DILocation(line: 19, column: 22, scope: !26)
!32 = !DILocation(line: 19, column: 3, scope: !26)
!33 = !DILocation(line: 20, column: 19, scope: !26)
!34 = !DILocation(line: 20, column: 10, scope: !26)
!35 = !DILocation(line: 20, column: 3, scope: !26)
