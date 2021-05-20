; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @myfunc(i32 %x) #0 !dbg !7 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %x.addr, align 4, !dbg !13
  %cmp = icmp sgt i32 %0, 0, !dbg !15
  br i1 %cmp, label %if.then, label %if.else18, !dbg !16

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %x.addr, align 4, !dbg !17
  %cmp1 = icmp sgt i32 %1, 9900, !dbg !20
  br i1 %cmp1, label %if.then2, label %if.else8, !dbg !21

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %x.addr, align 4, !dbg !22
  %cmp3 = icmp sgt i32 %2, 9950, !dbg !25
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !26

if.then4:                                         ; preds = %if.then2
  %3 = load i32, i32* %x.addr, align 4, !dbg !27
  %cmp5 = icmp sgt i32 %3, 9990, !dbg !30
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !31

if.then6:                                         ; preds = %if.then4
  br label %return, !dbg !32

if.else:                                          ; preds = %if.then4
  br label %return, !dbg !34

if.else7:                                         ; preds = %if.then2
  br label %return, !dbg !36

if.else8:                                         ; preds = %if.then
  %4 = load i32, i32* %x.addr, align 4, !dbg !38
  %cmp9 = icmp slt i32 %4, 100, !dbg !41
  br i1 %cmp9, label %if.then10, label %if.else17, !dbg !42

if.then10:                                        ; preds = %if.else8
  %5 = load i32, i32* %x.addr, align 4, !dbg !43
  %cmp11 = icmp slt i32 %5, 50, !dbg !46
  br i1 %cmp11, label %if.then12, label %if.else16, !dbg !47

if.then12:                                        ; preds = %if.then10
  %6 = load i32, i32* %x.addr, align 4, !dbg !48
  %cmp13 = icmp slt i32 %6, 10, !dbg !51
  br i1 %cmp13, label %if.then14, label %if.else15, !dbg !52

if.then14:                                        ; preds = %if.then12
  br label %return, !dbg !53

if.else15:                                        ; preds = %if.then12
  br label %return, !dbg !55

if.else16:                                        ; preds = %if.then10
  br label %return, !dbg !57

if.else17:                                        ; preds = %if.else8
  br label %return, !dbg !59

if.else18:                                        ; preds = %entry
  %7 = load i32, i32* %x.addr, align 4, !dbg !61
  %cmp19 = icmp slt i32 %7, -9900, !dbg !64
  br i1 %cmp19, label %if.then20, label %if.else27, !dbg !65

if.then20:                                        ; preds = %if.else18
  %8 = load i32, i32* %x.addr, align 4, !dbg !66
  %cmp21 = icmp slt i32 %8, -9950, !dbg !69
  br i1 %cmp21, label %if.then22, label %if.else26, !dbg !70

if.then22:                                        ; preds = %if.then20
  %9 = load i32, i32* %x.addr, align 4, !dbg !71
  %cmp23 = icmp slt i32 %9, -9990, !dbg !74
  br i1 %cmp23, label %if.then24, label %if.else25, !dbg !75

if.then24:                                        ; preds = %if.then22
  br label %return, !dbg !76

if.else25:                                        ; preds = %if.then22
  br label %return, !dbg !78

if.else26:                                        ; preds = %if.then20
  br label %return, !dbg !80

if.else27:                                        ; preds = %if.else18
  %10 = load i32, i32* %x.addr, align 4, !dbg !82
  %cmp28 = icmp sgt i32 %10, -100, !dbg !85
  br i1 %cmp28, label %if.then29, label %if.else36, !dbg !86

if.then29:                                        ; preds = %if.else27
  %11 = load i32, i32* %x.addr, align 4, !dbg !87
  %cmp30 = icmp sgt i32 %11, -50, !dbg !90
  br i1 %cmp30, label %if.then31, label %if.else35, !dbg !91

if.then31:                                        ; preds = %if.then29
  %12 = load i32, i32* %x.addr, align 4, !dbg !92
  %cmp32 = icmp sgt i32 %12, -10, !dbg !95
  br i1 %cmp32, label %if.then33, label %if.else34, !dbg !96

if.then33:                                        ; preds = %if.then31
  br label %return, !dbg !97

if.else34:                                        ; preds = %if.then31
  br label %return, !dbg !99

if.else35:                                        ; preds = %if.then29
  br label %return, !dbg !101

if.else36:                                        ; preds = %if.else27
  br label %return, !dbg !103

return:                                           ; preds = %if.else36, %if.else35, %if.else34, %if.then33, %if.else26, %if.else25, %if.then24, %if.else17, %if.else16, %if.else15, %if.then14, %if.else7, %if.else, %if.then6
  ret void, !dbg !105
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !106 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !112, metadata !DIExpression()), !dbg !113
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %a, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32* %b, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !120
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !120
  %call = call i32 @atoi(i8* %1) #3, !dbg !121
  store i32 %call, i32* %a, align 4, !dbg !122
  %2 = load i32, i32* %a, align 4, !dbg !123
  call void @myfunc(i32 %2), !dbg !124
  ret i32 0, !dbg !125
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #2

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 12.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 21d64c32eca63e98a94675cfc074f82371cadfe7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test.c", directory: "/home/citceae/Probtest/ver1/source/func3/TESTDATA/twoway")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 12.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 21d64c32eca63e98a94675cfc074f82371cadfe7)"}
!7 = distinct !DISubprogram(name: "myfunc", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 4, column: 17, scope: !7)
!13 = !DILocation(line: 5, column: 8, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 8)
!15 = !DILocation(line: 5, column: 9, scope: !14)
!16 = !DILocation(line: 5, column: 8, scope: !7)
!17 = !DILocation(line: 6, column: 6, scope: !18)
!18 = distinct !DILexicalBlock(scope: !19, file: !1, line: 6, column: 6)
!19 = distinct !DILexicalBlock(scope: !14, file: !1, line: 5, column: 12)
!20 = !DILocation(line: 6, column: 7, scope: !18)
!21 = !DILocation(line: 6, column: 6, scope: !19)
!22 = !DILocation(line: 7, column: 7, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 7, column: 7)
!24 = distinct !DILexicalBlock(scope: !18, file: !1, line: 6, column: 13)
!25 = !DILocation(line: 7, column: 8, scope: !23)
!26 = !DILocation(line: 7, column: 7, scope: !24)
!27 = !DILocation(line: 8, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !1, line: 8, column: 8)
!29 = distinct !DILexicalBlock(scope: !23, file: !1, line: 7, column: 14)
!30 = !DILocation(line: 8, column: 9, scope: !28)
!31 = !DILocation(line: 8, column: 8, scope: !29)
!32 = !DILocation(line: 9, column: 6, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 8, column: 15)
!34 = !DILocation(line: 12, column: 6, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !1, line: 11, column: 9)
!36 = !DILocation(line: 16, column: 5, scope: !37)
!37 = distinct !DILexicalBlock(scope: !23, file: !1, line: 15, column: 8)
!38 = !DILocation(line: 20, column: 7, scope: !39)
!39 = distinct !DILexicalBlock(scope: !40, file: !1, line: 20, column: 7)
!40 = distinct !DILexicalBlock(scope: !18, file: !1, line: 19, column: 7)
!41 = !DILocation(line: 20, column: 8, scope: !39)
!42 = !DILocation(line: 20, column: 7, scope: !40)
!43 = !DILocation(line: 21, column: 8, scope: !44)
!44 = distinct !DILexicalBlock(scope: !45, file: !1, line: 21, column: 8)
!45 = distinct !DILexicalBlock(scope: !39, file: !1, line: 20, column: 13)
!46 = !DILocation(line: 21, column: 9, scope: !44)
!47 = !DILocation(line: 21, column: 8, scope: !45)
!48 = !DILocation(line: 22, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 22, column: 9)
!50 = distinct !DILexicalBlock(scope: !44, file: !1, line: 21, column: 13)
!51 = !DILocation(line: 22, column: 10, scope: !49)
!52 = !DILocation(line: 22, column: 9, scope: !50)
!53 = !DILocation(line: 23, column: 7, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !1, line: 22, column: 14)
!55 = !DILocation(line: 26, column: 7, scope: !56)
!56 = distinct !DILexicalBlock(scope: !49, file: !1, line: 25, column: 10)
!57 = !DILocation(line: 30, column: 6, scope: !58)
!58 = distinct !DILexicalBlock(scope: !44, file: !1, line: 29, column: 9)
!59 = !DILocation(line: 34, column: 5, scope: !60)
!60 = distinct !DILexicalBlock(scope: !39, file: !1, line: 33, column: 8)
!61 = !DILocation(line: 39, column: 6, scope: !62)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 39, column: 6)
!63 = distinct !DILexicalBlock(scope: !14, file: !1, line: 38, column: 6)
!64 = !DILocation(line: 39, column: 7, scope: !62)
!65 = !DILocation(line: 39, column: 6, scope: !63)
!66 = !DILocation(line: 40, column: 7, scope: !67)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 40, column: 7)
!68 = distinct !DILexicalBlock(scope: !62, file: !1, line: 39, column: 14)
!69 = !DILocation(line: 40, column: 8, scope: !67)
!70 = !DILocation(line: 40, column: 7, scope: !68)
!71 = !DILocation(line: 41, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 41, column: 8)
!73 = distinct !DILexicalBlock(scope: !67, file: !1, line: 40, column: 15)
!74 = !DILocation(line: 41, column: 9, scope: !72)
!75 = !DILocation(line: 41, column: 8, scope: !73)
!76 = !DILocation(line: 42, column: 6, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !1, line: 41, column: 16)
!78 = !DILocation(line: 45, column: 6, scope: !79)
!79 = distinct !DILexicalBlock(scope: !72, file: !1, line: 44, column: 9)
!80 = !DILocation(line: 49, column: 5, scope: !81)
!81 = distinct !DILexicalBlock(scope: !67, file: !1, line: 48, column: 8)
!82 = !DILocation(line: 53, column: 7, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 53, column: 7)
!84 = distinct !DILexicalBlock(scope: !62, file: !1, line: 52, column: 7)
!85 = !DILocation(line: 53, column: 8, scope: !83)
!86 = !DILocation(line: 53, column: 7, scope: !84)
!87 = !DILocation(line: 54, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !89, file: !1, line: 54, column: 8)
!89 = distinct !DILexicalBlock(scope: !83, file: !1, line: 53, column: 14)
!90 = !DILocation(line: 54, column: 9, scope: !88)
!91 = !DILocation(line: 54, column: 8, scope: !89)
!92 = !DILocation(line: 55, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 55, column: 9)
!94 = distinct !DILexicalBlock(scope: !88, file: !1, line: 54, column: 14)
!95 = !DILocation(line: 55, column: 10, scope: !93)
!96 = !DILocation(line: 55, column: 9, scope: !94)
!97 = !DILocation(line: 56, column: 7, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !1, line: 55, column: 15)
!99 = !DILocation(line: 59, column: 7, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !1, line: 58, column: 10)
!101 = !DILocation(line: 63, column: 6, scope: !102)
!102 = distinct !DILexicalBlock(scope: !88, file: !1, line: 62, column: 9)
!103 = !DILocation(line: 67, column: 5, scope: !104)
!104 = distinct !DILexicalBlock(scope: !83, file: !1, line: 66, column: 8)
!105 = !DILocation(line: 71, column: 1, scope: !7)
!106 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 73, type: !107, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DISubroutineType(types: !108)
!108 = !{!10, !10, !109}
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!112 = !DILocalVariable(name: "argc", arg: 1, scope: !106, file: !1, line: 73, type: !10)
!113 = !DILocation(line: 73, column: 14, scope: !106)
!114 = !DILocalVariable(name: "argv", arg: 2, scope: !106, file: !1, line: 73, type: !109)
!115 = !DILocation(line: 73, column: 26, scope: !106)
!116 = !DILocalVariable(name: "a", scope: !106, file: !1, line: 74, type: !10)
!117 = !DILocation(line: 74, column: 9, scope: !106)
!118 = !DILocalVariable(name: "b", scope: !106, file: !1, line: 74, type: !10)
!119 = !DILocation(line: 74, column: 11, scope: !106)
!120 = !DILocation(line: 75, column: 14, scope: !106)
!121 = !DILocation(line: 75, column: 9, scope: !106)
!122 = !DILocation(line: 75, column: 7, scope: !106)
!123 = !DILocation(line: 76, column: 12, scope: !106)
!124 = !DILocation(line: 76, column: 5, scope: !106)
!125 = !DILocation(line: 77, column: 5, scope: !106)
