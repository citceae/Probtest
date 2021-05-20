; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Lower case character.\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"Upper case character.\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"Digit\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Special character.\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @checkalpha(i32 %ch) #0 !dbg !7 {
entry:
  %ch.addr = alloca i32, align 4
  store i32 %ch, i32* %ch.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ch.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %ch.addr, align 4, !dbg !13
  %cmp = icmp sge i32 %0, 97, !dbg !15
  br i1 %cmp, label %if.then, label %if.else, !dbg !16

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %ch.addr, align 4, !dbg !17
  %cmp1 = icmp sle i32 %1, 122, !dbg !20
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !21

if.then2:                                         ; preds = %if.then
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0)), !dbg !22
  br label %if.end, !dbg !22

if.end:                                           ; preds = %if.then2, %if.then
  br label %return, !dbg !23

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %ch.addr, align 4, !dbg !24
  %cmp3 = icmp sge i32 %2, 65, !dbg !26
  br i1 %cmp3, label %if.then4, label %if.else9, !dbg !27

if.then4:                                         ; preds = %if.else
  %3 = load i32, i32* %ch.addr, align 4, !dbg !28
  %cmp5 = icmp sle i32 %3, 90, !dbg !31
  br i1 %cmp5, label %if.then6, label %if.end8, !dbg !32

if.then6:                                         ; preds = %if.then4
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0)), !dbg !33
  br label %if.end8, !dbg !33

if.end8:                                          ; preds = %if.then6, %if.then4
  br label %return, !dbg !34

if.else9:                                         ; preds = %if.else
  %4 = load i32, i32* %ch.addr, align 4, !dbg !35
  %cmp10 = icmp sge i32 %4, 48, !dbg !37
  br i1 %cmp10, label %if.then11, label %if.else16, !dbg !38

if.then11:                                        ; preds = %if.else9
  %5 = load i32, i32* %ch.addr, align 4, !dbg !39
  %cmp12 = icmp sle i32 %5, 57, !dbg !42
  br i1 %cmp12, label %if.then13, label %if.end15, !dbg !43

if.then13:                                        ; preds = %if.then11
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0)), !dbg !44
  br label %if.end15, !dbg !44

if.end15:                                         ; preds = %if.then13, %if.then11
  br label %return, !dbg !45

if.else16:                                        ; preds = %if.else9
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0)), !dbg !46
  br label %return, !dbg !48

return:                                           ; preds = %if.else16, %if.end15, %if.end8, %if.end
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %ch = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i32* %ch, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !62
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !62
  %call = call i32 @atoi(i8* %1) #4, !dbg !63
  store i32 %call, i32* %ch, align 4, !dbg !64
  %2 = load i32, i32* %ch, align 4, !dbg !65
  call void @checkalpha(i32 %2), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!3}
!llvm.module.flags = !{!4, !5, !6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 12.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 21d64c32eca63e98a94675cfc074f82371cadfe7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test.c", directory: "/home/citceae/Probtest/ver1/source/func3/TESTDATA/checkalpha")
!2 = !{}
!3 = !{!"clang version 12.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 21d64c32eca63e98a94675cfc074f82371cadfe7)"}
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = distinct !DISubprogram(name: "checkalpha", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "ch", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 3, column: 21, scope: !7)
!13 = !DILocation(line: 4, column: 8, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 4, column: 8)
!15 = !DILocation(line: 4, column: 11, scope: !14)
!16 = !DILocation(line: 4, column: 8, scope: !7)
!17 = !DILocation(line: 5, column: 12, scope: !18)
!18 = distinct !DILexicalBlock(scope: !19, file: !1, line: 5, column: 12)
!19 = distinct !DILexicalBlock(scope: !14, file: !1, line: 4, column: 16)
!20 = !DILocation(line: 5, column: 15, scope: !18)
!21 = !DILocation(line: 5, column: 12, scope: !19)
!22 = !DILocation(line: 6, column: 13, scope: !18)
!23 = !DILocation(line: 7, column: 9, scope: !19)
!24 = !DILocation(line: 9, column: 13, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !1, line: 9, column: 13)
!26 = !DILocation(line: 9, column: 16, scope: !25)
!27 = !DILocation(line: 9, column: 13, scope: !14)
!28 = !DILocation(line: 10, column: 12, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 10, column: 12)
!30 = distinct !DILexicalBlock(scope: !25, file: !1, line: 9, column: 21)
!31 = !DILocation(line: 10, column: 15, scope: !29)
!32 = !DILocation(line: 10, column: 12, scope: !30)
!33 = !DILocation(line: 11, column: 13, scope: !29)
!34 = !DILocation(line: 12, column: 9, scope: !30)
!35 = !DILocation(line: 14, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !25, file: !1, line: 14, column: 13)
!37 = !DILocation(line: 14, column: 16, scope: !36)
!38 = !DILocation(line: 14, column: 13, scope: !25)
!39 = !DILocation(line: 15, column: 12, scope: !40)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 15, column: 12)
!41 = distinct !DILexicalBlock(scope: !36, file: !1, line: 14, column: 22)
!42 = !DILocation(line: 15, column: 15, scope: !40)
!43 = !DILocation(line: 15, column: 12, scope: !41)
!44 = !DILocation(line: 16, column: 13, scope: !40)
!45 = !DILocation(line: 17, column: 9, scope: !41)
!46 = !DILocation(line: 20, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !1, line: 19, column: 9)
!48 = !DILocation(line: 21, column: 9, scope: !47)
!49 = !DILocation(line: 23, column: 1, scope: !7)
!50 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 24, type: !51, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!10, !10, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !1, line: 24, type: !10)
!57 = !DILocation(line: 24, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !1, line: 24, type: !53)
!59 = !DILocation(line: 24, column: 26, scope: !50)
!60 = !DILocalVariable(name: "ch", scope: !50, file: !1, line: 25, type: !10)
!61 = !DILocation(line: 25, column: 9, scope: !50)
!62 = !DILocation(line: 29, column: 15, scope: !50)
!63 = !DILocation(line: 29, column: 10, scope: !50)
!64 = !DILocation(line: 29, column: 8, scope: !50)
!65 = !DILocation(line: 31, column: 16, scope: !50)
!66 = !DILocation(line: 31, column: 5, scope: !50)
!67 = !DILocation(line: 33, column: 5, scope: !50)
