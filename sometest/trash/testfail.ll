; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @getgrade(i32 %score) #0 !dbg !7 {
entry:
  %score.addr = alloca i32, align 4
  %grade = alloca i32, align 4
  store i32 %score, i32* %score.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %score.addr, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %grade, metadata !13, metadata !DIExpression()), !dbg !14
  %0 = load i32, i32* %score.addr, align 4, !dbg !15
  %cmp = icmp sge i32 %0, 90, !dbg !17
  br i1 %cmp, label %if.then, label %if.else, !dbg !18

if.then:                                          ; preds = %entry
  store i32 1, i32* %grade, align 4, !dbg !19
  br label %if.end13, !dbg !20

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %score.addr, align 4, !dbg !21
  %cmp1 = icmp sge i32 %1, 80, !dbg !23
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !24

if.then2:                                         ; preds = %if.else
  store i32 2, i32* %grade, align 4, !dbg !25
  br label %if.end, !dbg !26

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %score.addr, align 4, !dbg !27
  %cmp4 = icmp sge i32 %2, 70, !dbg !29
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !30

if.then5:                                         ; preds = %if.else3
  br label %return, !dbg !31

if.else6:                                         ; preds = %if.else3
  %3 = load i32, i32* %score.addr, align 4, !dbg !32
  %cmp7 = icmp sge i32 %3, 60, !dbg !34
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !35

if.then8:                                         ; preds = %if.else6
  br label %return, !dbg !36

if.else9:                                         ; preds = %if.else6
  %4 = load i32, i32* %score.addr, align 4, !dbg !37
  %cmp10 = icmp sge i32 %4, 50, !dbg !39
  br i1 %cmp10, label %if.then11, label %if.else12, !dbg !40

if.then11:                                        ; preds = %if.else9
  br label %return, !dbg !41

if.else12:                                        ; preds = %if.else9
  br label %return, !dbg !42

if.end:                                           ; preds = %if.then2
  br label %if.end13

if.end13:                                         ; preds = %if.end, %if.then
  br label %return, !dbg !43

return:                                           ; preds = %if.end13, %if.else12, %if.then11, %if.then8, %if.then5
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
  %score = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32* %score, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !57
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !57
  %call = call i32 @atoi(i8* %1) #3, !dbg !58
  store i32 %call, i32* %score, align 4, !dbg !59
  %2 = load i32, i32* %score, align 4, !dbg !60
  call void @getgrade(i32 %2), !dbg !61
  ret i32 0, !dbg !62
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
!1 = !DIFile(filename: "test.c", directory: "/home/citceae/Probtest/ver1/source/func3/TESTDATA/grade")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 12.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 21d64c32eca63e98a94675cfc074f82371cadfe7)"}
!7 = distinct !DISubprogram(name: "getgrade", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "score", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 3, column: 19, scope: !7)
!13 = !DILocalVariable(name: "grade", scope: !7, file: !1, line: 4, type: !10)
!14 = !DILocation(line: 4, column: 9, scope: !7)
!15 = !DILocation(line: 5, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 8)
!17 = !DILocation(line: 5, column: 13, scope: !16)
!18 = !DILocation(line: 5, column: 8, scope: !7)
!19 = !DILocation(line: 6, column: 13, scope: !16)
!20 = !DILocation(line: 6, column: 7, scope: !16)
!21 = !DILocation(line: 7, column: 13, scope: !22)
!22 = distinct !DILexicalBlock(scope: !16, file: !1, line: 7, column: 13)
!23 = !DILocation(line: 7, column: 19, scope: !22)
!24 = !DILocation(line: 7, column: 13, scope: !16)
!25 = !DILocation(line: 8, column: 13, scope: !22)
!26 = !DILocation(line: 8, column: 7, scope: !22)
!27 = !DILocation(line: 9, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !1, line: 9, column: 13)
!29 = !DILocation(line: 9, column: 18, scope: !28)
!30 = !DILocation(line: 9, column: 13, scope: !22)
!31 = !DILocation(line: 10, column: 7, scope: !28)
!32 = !DILocation(line: 11, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 11, column: 13)
!34 = !DILocation(line: 11, column: 18, scope: !33)
!35 = !DILocation(line: 11, column: 13, scope: !28)
!36 = !DILocation(line: 12, column: 7, scope: !33)
!37 = !DILocation(line: 13, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !33, file: !1, line: 13, column: 13)
!39 = !DILocation(line: 13, column: 18, scope: !38)
!40 = !DILocation(line: 13, column: 13, scope: !33)
!41 = !DILocation(line: 14, column: 7, scope: !38)
!42 = !DILocation(line: 15, column: 10, scope: !38)
!43 = !DILocation(line: 16, column: 5, scope: !7)
!44 = !DILocation(line: 17, column: 1, scope: !7)
!45 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 18, type: !46, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!10, !10, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !1, line: 18, type: !10)
!52 = !DILocation(line: 18, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !1, line: 18, type: !48)
!54 = !DILocation(line: 18, column: 26, scope: !45)
!55 = !DILocalVariable(name: "score", scope: !45, file: !1, line: 20, type: !10)
!56 = !DILocation(line: 20, column: 9, scope: !45)
!57 = !DILocation(line: 22, column: 18, scope: !45)
!58 = !DILocation(line: 22, column: 13, scope: !45)
!59 = !DILocation(line: 22, column: 11, scope: !45)
!60 = !DILocation(line: 23, column: 14, scope: !45)
!61 = !DILocation(line: 23, column: 5, scope: !45)
!62 = !DILocation(line: 25, column: 5, scope: !45)
