; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @myfunc(i32 %x, i32 %y) #0 !dbg !7 {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !13, metadata !DIExpression()), !dbg !14
  %0 = load i32, i32* %x.addr, align 4, !dbg !15
  %cmp = icmp sge i32 %0, 9900, !dbg !17
  br i1 %cmp, label %if.then, label %if.else8, !dbg !18

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %x.addr, align 4, !dbg !19
  %2 = load i32, i32* %y.addr, align 4, !dbg !22
  %cmp1 = icmp slt i32 %1, %2, !dbg !23
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !24

if.then2:                                         ; preds = %if.then
  br label %return, !dbg !25

if.end:                                           ; preds = %if.then
  %3 = load i32, i32* %x.addr, align 4, !dbg !26
  %cmp3 = icmp sge i32 %3, 9950, !dbg !28
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !29

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %x.addr, align 4, !dbg !30
  %cmp5 = icmp sge i32 %4, 9990, !dbg !33
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !34

if.then6:                                         ; preds = %if.then4
  br label %return, !dbg !35

if.else:                                          ; preds = %if.then4
  br label %return, !dbg !37

if.else7:                                         ; preds = %if.end
  br label %return, !dbg !39

if.else8:                                         ; preds = %entry
  br label %return, !dbg !41

return:                                           ; preds = %if.else8, %if.else7, %if.else, %if.then6, %if.then2
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %a, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i32* %b, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !58
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !58
  %call = call i32 @atoi(i8* %1) #3, !dbg !59
  store i32 %call, i32* %a, align 4, !dbg !60
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2, !dbg !61
  %3 = load i8*, i8** %arrayidx1, align 8, !dbg !61
  %call2 = call i32 @atoi(i8* %3) #3, !dbg !62
  store i32 %call2, i32* %b, align 4, !dbg !63
  %4 = load i32, i32* %a, align 4, !dbg !64
  %5 = load i32, i32* %b, align 4, !dbg !65
  call void @myfunc(i32 %4, i32 %5), !dbg !66
  ret i32 0, !dbg !67
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
!1 = !DIFile(filename: "test.c", directory: "/home/citceae/Probtest/ver1/source/func3/TESTDATA/examtest")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 12.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 21d64c32eca63e98a94675cfc074f82371cadfe7)"}
!7 = distinct !DISubprogram(name: "myfunc", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 4, column: 17, scope: !7)
!13 = !DILocalVariable(name: "y", arg: 2, scope: !7, file: !1, line: 4, type: !10)
!14 = !DILocation(line: 4, column: 23, scope: !7)
!15 = !DILocation(line: 5, column: 9, scope: !16)
!16 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 9)
!17 = !DILocation(line: 5, column: 10, scope: !16)
!18 = !DILocation(line: 5, column: 9, scope: !7)
!19 = !DILocation(line: 6, column: 13, scope: !20)
!20 = distinct !DILexicalBlock(scope: !21, file: !1, line: 6, column: 13)
!21 = distinct !DILexicalBlock(scope: !16, file: !1, line: 5, column: 17)
!22 = !DILocation(line: 6, column: 15, scope: !20)
!23 = !DILocation(line: 6, column: 14, scope: !20)
!24 = !DILocation(line: 6, column: 13, scope: !21)
!25 = !DILocation(line: 7, column: 14, scope: !20)
!26 = !DILocation(line: 8, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !21, file: !1, line: 8, column: 9)
!28 = !DILocation(line: 8, column: 10, scope: !27)
!29 = !DILocation(line: 8, column: 9, scope: !21)
!30 = !DILocation(line: 9, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !1, line: 9, column: 13)
!32 = distinct !DILexicalBlock(scope: !27, file: !1, line: 8, column: 17)
!33 = !DILocation(line: 9, column: 14, scope: !31)
!34 = !DILocation(line: 9, column: 13, scope: !32)
!35 = !DILocation(line: 10, column: 11, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !1, line: 9, column: 21)
!37 = !DILocation(line: 13, column: 14, scope: !38)
!38 = distinct !DILexicalBlock(scope: !31, file: !1, line: 12, column: 14)
!39 = !DILocation(line: 17, column: 10, scope: !40)
!40 = distinct !DILexicalBlock(scope: !27, file: !1, line: 16, column: 10)
!41 = !DILocation(line: 21, column: 9, scope: !42)
!42 = distinct !DILexicalBlock(scope: !16, file: !1, line: 20, column: 9)
!43 = !DILocation(line: 23, column: 1, scope: !7)
!44 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 25, type: !45, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!10, !10, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !1, line: 25, type: !10)
!51 = !DILocation(line: 25, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !1, line: 25, type: !47)
!53 = !DILocation(line: 25, column: 26, scope: !44)
!54 = !DILocalVariable(name: "a", scope: !44, file: !1, line: 26, type: !10)
!55 = !DILocation(line: 26, column: 9, scope: !44)
!56 = !DILocalVariable(name: "b", scope: !44, file: !1, line: 26, type: !10)
!57 = !DILocation(line: 26, column: 11, scope: !44)
!58 = !DILocation(line: 27, column: 14, scope: !44)
!59 = !DILocation(line: 27, column: 9, scope: !44)
!60 = !DILocation(line: 27, column: 7, scope: !44)
!61 = !DILocation(line: 28, column: 14, scope: !44)
!62 = !DILocation(line: 28, column: 9, scope: !44)
!63 = !DILocation(line: 28, column: 7, scope: !44)
!64 = !DILocation(line: 29, column: 12, scope: !44)
!65 = !DILocation(line: 29, column: 14, scope: !44)
!66 = !DILocation(line: 29, column: 5, scope: !44)
!67 = !DILocation(line: 31, column: 5, scope: !44)
