; ModuleID = './TESTDATA/examtest/test.c'
source_filename = "./TESTDATA/examtest/test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @myfunc(i32 %x, i32 %y) #0 !dbg !7 {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* %x.addr, align 4, !dbg !16
  %cmp = icmp sge i32 %0, 9900, !dbg !18
  br i1 %cmp, label %if.then, label %if.else8, !dbg !19

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %x.addr, align 4, !dbg !20
  %2 = load i32, i32* %y.addr, align 4, !dbg !23
  %cmp1 = icmp slt i32 %1, %2, !dbg !24
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !25

if.then2:                                         ; preds = %if.then
  br label %return, !dbg !26

if.end:                                           ; preds = %if.then
  %3 = load i32, i32* %x.addr, align 4, !dbg !27
  %cmp3 = icmp sge i32 %3, 9950, !dbg !29
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !30

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %x.addr, align 4, !dbg !31
  %cmp5 = icmp sge i32 %4, 9990, !dbg !34
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !35

if.then6:                                         ; preds = %if.then4
  br label %return, !dbg !36

if.else:                                          ; preds = %if.then4
  br label %return, !dbg !38

if.else7:                                         ; preds = %if.end
  br label %return, !dbg !40

if.else8:                                         ; preds = %entry
  br label %return, !dbg !42

return:                                           ; preds = %if.else8, %if.else7, %if.else, %if.then6, %if.then2
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32* %a, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32* %b, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !59
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !59
  %call = call i32 @atoi(i8* %1) #3, !dbg !60
  store i32 %call, i32* %a, align 4, !dbg !61
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2, !dbg !62
  %3 = load i8*, i8** %arrayidx1, align 8, !dbg !62
  %call2 = call i32 @atoi(i8* %3) #3, !dbg !63
  store i32 %call2, i32* %b, align 4, !dbg !64
  %4 = load i32, i32* %a, align 4, !dbg !65
  %5 = load i32, i32* %b, align 4, !dbg !66
  call void @myfunc(i32 %4, i32 %5), !dbg !67
  ret i32 0, !dbg !68
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
!1 = !DIFile(filename: "TESTDATA/examtest/test.c", directory: "/home/citceae/Probtest/ver1/source/func3")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 12.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 21d64c32eca63e98a94675cfc074f82371cadfe7)"}
!7 = distinct !DISubprogram(name: "myfunc", scope: !8, file: !8, line: 4, type: !9, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./TESTDATA/examtest/test.c", directory: "/home/citceae/Probtest/ver1/source/func3")
!9 = !DISubroutineType(types: !10)
!10 = !{null, !11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !8, line: 4, type: !11)
!13 = !DILocation(line: 4, column: 17, scope: !7)
!14 = !DILocalVariable(name: "y", arg: 2, scope: !7, file: !8, line: 4, type: !11)
!15 = !DILocation(line: 4, column: 23, scope: !7)
!16 = !DILocation(line: 5, column: 9, scope: !17)
!17 = distinct !DILexicalBlock(scope: !7, file: !8, line: 5, column: 9)
!18 = !DILocation(line: 5, column: 10, scope: !17)
!19 = !DILocation(line: 5, column: 9, scope: !7)
!20 = !DILocation(line: 6, column: 13, scope: !21)
!21 = distinct !DILexicalBlock(scope: !22, file: !8, line: 6, column: 13)
!22 = distinct !DILexicalBlock(scope: !17, file: !8, line: 5, column: 17)
!23 = !DILocation(line: 6, column: 15, scope: !21)
!24 = !DILocation(line: 6, column: 14, scope: !21)
!25 = !DILocation(line: 6, column: 13, scope: !22)
!26 = !DILocation(line: 7, column: 14, scope: !21)
!27 = !DILocation(line: 8, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !8, line: 8, column: 9)
!29 = !DILocation(line: 8, column: 10, scope: !28)
!30 = !DILocation(line: 8, column: 9, scope: !22)
!31 = !DILocation(line: 9, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !8, line: 9, column: 13)
!33 = distinct !DILexicalBlock(scope: !28, file: !8, line: 8, column: 17)
!34 = !DILocation(line: 9, column: 14, scope: !32)
!35 = !DILocation(line: 9, column: 13, scope: !33)
!36 = !DILocation(line: 10, column: 11, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !8, line: 9, column: 21)
!38 = !DILocation(line: 13, column: 14, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !8, line: 12, column: 14)
!40 = !DILocation(line: 17, column: 10, scope: !41)
!41 = distinct !DILexicalBlock(scope: !28, file: !8, line: 16, column: 10)
!42 = !DILocation(line: 21, column: 9, scope: !43)
!43 = distinct !DILexicalBlock(scope: !17, file: !8, line: 20, column: 9)
!44 = !DILocation(line: 23, column: 1, scope: !7)
!45 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 25, type: !46, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!11, !11, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !8, line: 25, type: !11)
!52 = !DILocation(line: 25, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !8, line: 25, type: !48)
!54 = !DILocation(line: 25, column: 26, scope: !45)
!55 = !DILocalVariable(name: "a", scope: !45, file: !8, line: 26, type: !11)
!56 = !DILocation(line: 26, column: 9, scope: !45)
!57 = !DILocalVariable(name: "b", scope: !45, file: !8, line: 26, type: !11)
!58 = !DILocation(line: 26, column: 11, scope: !45)
!59 = !DILocation(line: 27, column: 14, scope: !45)
!60 = !DILocation(line: 27, column: 9, scope: !45)
!61 = !DILocation(line: 27, column: 7, scope: !45)
!62 = !DILocation(line: 28, column: 14, scope: !45)
!63 = !DILocation(line: 28, column: 9, scope: !45)
!64 = !DILocation(line: 28, column: 7, scope: !45)
!65 = !DILocation(line: 29, column: 12, scope: !45)
!66 = !DILocation(line: 29, column: 14, scope: !45)
!67 = !DILocation(line: 29, column: 5, scope: !45)
!68 = !DILocation(line: 31, column: 5, scope: !45)
