; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @getgrade(i32 %score) #0 !dbg !7 {
entry:
  %score.addr = alloca i32, align 4
  store i32 %score, i32* %score.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %score.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %score.addr, align 4, !dbg !13
  %cmp = icmp sge i32 %0, 90, !dbg !15
  br i1 %cmp, label %if.then, label %if.else, !dbg !16

if.then:                                          ; preds = %entry
  br label %return, !dbg !17

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %score.addr, align 4, !dbg !18
  %cmp1 = icmp sge i32 %1, 70, !dbg !20
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !21

if.then2:                                         ; preds = %if.else
  br label %return, !dbg !22

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %score.addr, align 4, !dbg !23
  %cmp4 = icmp sge i32 %2, 50, !dbg !25
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !26

if.then5:                                         ; preds = %if.else3
  br label %return, !dbg !27

if.else6:                                         ; preds = %if.else3
  %3 = load i32, i32* %score.addr, align 4, !dbg !28
  %cmp7 = icmp sge i32 %3, 30, !dbg !30
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !31

if.then8:                                         ; preds = %if.else6
  br label %return, !dbg !32

if.else9:                                         ; preds = %if.else6
  %4 = load i32, i32* %score.addr, align 4, !dbg !33
  %cmp10 = icmp sge i32 %4, 10, !dbg !35
  br i1 %cmp10, label %if.then11, label %if.else12, !dbg !36

if.then11:                                        ; preds = %if.else9
  br label %return, !dbg !37

if.else12:                                        ; preds = %if.else9
  br label %return, !dbg !38

return:                                           ; preds = %if.else12, %if.then11, %if.then8, %if.then5, %if.then2, %if.then
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %score = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %score, metadata !50, metadata !DIExpression()), !dbg !51
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !52
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !52
  %call = call i32 @atoi(i8* %1) #3, !dbg !53
  store i32 %call, i32* %score, align 4, !dbg !54
  %2 = load i32, i32* %score, align 4, !dbg !55
  call void @getgrade(i32 %2), !dbg !56
  ret i32 0, !dbg !57
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #2

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!3}
!llvm.module.flags = !{!4, !5, !6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 12.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 21d64c32eca63e98a94675cfc074f82371cadfe7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test.c", directory: "/home/citceae/Probtest/ver1/source/func3/TESTDATA/grade")
!2 = !{}
!3 = !{!"clang version 12.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 21d64c32eca63e98a94675cfc074f82371cadfe7)"}
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = distinct !DISubprogram(name: "getgrade", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "score", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 3, column: 19, scope: !7)
!13 = !DILocation(line: 4, column: 8, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 4, column: 8)
!15 = !DILocation(line: 4, column: 13, scope: !14)
!16 = !DILocation(line: 4, column: 8, scope: !7)
!17 = !DILocation(line: 5, column: 7, scope: !14)
!18 = !DILocation(line: 6, column: 13, scope: !19)
!19 = distinct !DILexicalBlock(scope: !14, file: !1, line: 6, column: 13)
!20 = !DILocation(line: 6, column: 19, scope: !19)
!21 = !DILocation(line: 6, column: 13, scope: !14)
!22 = !DILocation(line: 7, column: 7, scope: !19)
!23 = !DILocation(line: 8, column: 13, scope: !24)
!24 = distinct !DILexicalBlock(scope: !19, file: !1, line: 8, column: 13)
!25 = !DILocation(line: 8, column: 18, scope: !24)
!26 = !DILocation(line: 8, column: 13, scope: !19)
!27 = !DILocation(line: 9, column: 7, scope: !24)
!28 = !DILocation(line: 10, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !1, line: 10, column: 13)
!30 = !DILocation(line: 10, column: 18, scope: !29)
!31 = !DILocation(line: 10, column: 13, scope: !24)
!32 = !DILocation(line: 11, column: 7, scope: !29)
!33 = !DILocation(line: 12, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !1, line: 12, column: 13)
!35 = !DILocation(line: 12, column: 18, scope: !34)
!36 = !DILocation(line: 12, column: 13, scope: !29)
!37 = !DILocation(line: 13, column: 7, scope: !34)
!38 = !DILocation(line: 14, column: 10, scope: !34)
!39 = !DILocation(line: 15, column: 1, scope: !7)
!40 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !41, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!10, !10, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !1, line: 16, type: !10)
!47 = !DILocation(line: 16, column: 14, scope: !40)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !1, line: 16, type: !43)
!49 = !DILocation(line: 16, column: 26, scope: !40)
!50 = !DILocalVariable(name: "score", scope: !40, file: !1, line: 18, type: !10)
!51 = !DILocation(line: 18, column: 9, scope: !40)
!52 = !DILocation(line: 20, column: 18, scope: !40)
!53 = !DILocation(line: 20, column: 13, scope: !40)
!54 = !DILocation(line: 20, column: 11, scope: !40)
!55 = !DILocation(line: 21, column: 14, scope: !40)
!56 = !DILocation(line: 21, column: 5, scope: !40)
!57 = !DILocation(line: 26, column: 5, scope: !40)
