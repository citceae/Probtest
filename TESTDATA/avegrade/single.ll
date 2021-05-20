; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %mark1 = alloca i32, align 4
  %mark2 = alloca i32, align 4
  %mark3 = alloca i32, align 4
  %total = alloca i32, align 4
  %avg = alloca float, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %mark1, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %mark2, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %mark3, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %total, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata float* %avg, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !29
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !29
  %call = call i32 @atoi(i8* %1) #3, !dbg !30
  store i32 %call, i32* %mark1, align 4, !dbg !31
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !32
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2, !dbg !32
  %3 = load i8*, i8** %arrayidx1, align 8, !dbg !32
  %call2 = call i32 @atoi(i8* %3) #3, !dbg !33
  store i32 %call2, i32* %mark2, align 4, !dbg !34
  %4 = load i8**, i8*** %argv.addr, align 8, !dbg !35
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i64 3, !dbg !35
  %5 = load i8*, i8** %arrayidx3, align 8, !dbg !35
  %call4 = call i32 @atoi(i8* %5) #3, !dbg !36
  store i32 %call4, i32* %mark3, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %a, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 0, i32* %a, align 4, !dbg !39
  %6 = load i32, i32* %mark1, align 4, !dbg !40
  %cmp = icmp sge i32 %6, 35, !dbg !42
  br i1 %cmp, label %land.lhs.true, label %if.else14, !dbg !43

land.lhs.true:                                    ; preds = %entry
  %7 = load i32, i32* %mark2, align 4, !dbg !44
  %cmp5 = icmp sge i32 %7, 35, !dbg !45
  br i1 %cmp5, label %land.lhs.true6, label %if.else14, !dbg !46

land.lhs.true6:                                   ; preds = %land.lhs.true
  %8 = load i32, i32* %mark3, align 4, !dbg !47
  %cmp7 = icmp sge i32 %8, 35, !dbg !48
  br i1 %cmp7, label %if.then, label %if.else14, !dbg !49

if.then:                                          ; preds = %land.lhs.true6
  %9 = load i32, i32* %mark1, align 4, !dbg !50
  %10 = load i32, i32* %mark2, align 4, !dbg !52
  %add = add nsw i32 %9, %10, !dbg !53
  %11 = load i32, i32* %mark3, align 4, !dbg !54
  %add8 = add nsw i32 %add, %11, !dbg !55
  store i32 %add8, i32* %total, align 4, !dbg !56
  %12 = load i32, i32* %total, align 4, !dbg !57
  %div = sdiv i32 %12, 3, !dbg !58
  %conv = sitofp i32 %div to float, !dbg !57
  store float %conv, float* %avg, align 4, !dbg !59
  %13 = load i32, i32* %a, align 4, !dbg !60
  %inc = add nsw i32 %13, 1, !dbg !60
  store i32 %inc, i32* %a, align 4, !dbg !60
  %14 = load float, float* %avg, align 4, !dbg !61
  %cmp9 = fcmp oge float %14, 6.000000e+01, !dbg !63
  br i1 %cmp9, label %if.then11, label %if.else, !dbg !64

if.then11:                                        ; preds = %if.then
  %15 = load i32, i32* %a, align 4, !dbg !65
  %inc12 = add nsw i32 %15, 1, !dbg !65
  store i32 %inc12, i32* %a, align 4, !dbg !65
  br label %if.end, !dbg !67

if.else:                                          ; preds = %if.then
  %16 = load i32, i32* %a, align 4, !dbg !68
  %inc13 = add nsw i32 %16, 1, !dbg !68
  store i32 %inc13, i32* %a, align 4, !dbg !68
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then11
  br label %if.end16, !dbg !70

if.else14:                                        ; preds = %land.lhs.true6, %land.lhs.true, %entry
  %17 = load i32, i32* %a, align 4, !dbg !71
  %inc15 = add nsw i32 %17, 1, !dbg !71
  store i32 %inc15, i32* %a, align 4, !dbg !71
  br label %if.end16

if.end16:                                         ; preds = %if.else14, %if.end
  ret i32 0, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

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
!1 = !DIFile(filename: "test.c", directory: "/home/citceae/Probtest/ver1/source/func3/TESTDATA/avegrade")
!2 = !{}
!3 = !{!"clang version 12.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 21d64c32eca63e98a94675cfc074f82371cadfe7)"}
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!15 = !DILocation(line: 3, column: 15, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 3, type: !11)
!17 = !DILocation(line: 3, column: 27, scope: !7)
!18 = !DILocalVariable(name: "mark1", scope: !7, file: !1, line: 5, type: !10)
!19 = !DILocation(line: 5, column: 8, scope: !7)
!20 = !DILocalVariable(name: "mark2", scope: !7, file: !1, line: 5, type: !10)
!21 = !DILocation(line: 5, column: 15, scope: !7)
!22 = !DILocalVariable(name: "mark3", scope: !7, file: !1, line: 5, type: !10)
!23 = !DILocation(line: 5, column: 22, scope: !7)
!24 = !DILocalVariable(name: "total", scope: !7, file: !1, line: 5, type: !10)
!25 = !DILocation(line: 5, column: 29, scope: !7)
!26 = !DILocalVariable(name: "avg", scope: !7, file: !1, line: 6, type: !27)
!27 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!28 = !DILocation(line: 6, column: 10, scope: !7)
!29 = !DILocation(line: 10, column: 17, scope: !7)
!30 = !DILocation(line: 10, column: 12, scope: !7)
!31 = !DILocation(line: 10, column: 10, scope: !7)
!32 = !DILocation(line: 11, column: 17, scope: !7)
!33 = !DILocation(line: 11, column: 12, scope: !7)
!34 = !DILocation(line: 11, column: 10, scope: !7)
!35 = !DILocation(line: 12, column: 17, scope: !7)
!36 = !DILocation(line: 12, column: 12, scope: !7)
!37 = !DILocation(line: 12, column: 10, scope: !7)
!38 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 13, type: !10)
!39 = !DILocation(line: 13, column: 8, scope: !7)
!40 = !DILocation(line: 14, column: 7, scope: !41)
!41 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 7)
!42 = !DILocation(line: 14, column: 12, scope: !41)
!43 = !DILocation(line: 14, column: 17, scope: !41)
!44 = !DILocation(line: 14, column: 20, scope: !41)
!45 = !DILocation(line: 14, column: 25, scope: !41)
!46 = !DILocation(line: 14, column: 30, scope: !41)
!47 = !DILocation(line: 14, column: 33, scope: !41)
!48 = !DILocation(line: 14, column: 38, scope: !41)
!49 = !DILocation(line: 14, column: 7, scope: !7)
!50 = !DILocation(line: 16, column: 14, scope: !51)
!51 = distinct !DILexicalBlock(scope: !41, file: !1, line: 15, column: 4)
!52 = !DILocation(line: 16, column: 22, scope: !51)
!53 = !DILocation(line: 16, column: 20, scope: !51)
!54 = !DILocation(line: 16, column: 30, scope: !51)
!55 = !DILocation(line: 16, column: 28, scope: !51)
!56 = !DILocation(line: 16, column: 12, scope: !51)
!57 = !DILocation(line: 17, column: 12, scope: !51)
!58 = !DILocation(line: 17, column: 17, scope: !51)
!59 = !DILocation(line: 17, column: 10, scope: !51)
!60 = !DILocation(line: 21, column: 7, scope: !51)
!61 = !DILocation(line: 23, column: 9, scope: !62)
!62 = distinct !DILexicalBlock(scope: !51, file: !1, line: 23, column: 9)
!63 = !DILocation(line: 23, column: 12, scope: !62)
!64 = !DILocation(line: 23, column: 9, scope: !51)
!65 = !DILocation(line: 26, column: 9, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !1, line: 24, column: 6)
!67 = !DILocation(line: 27, column: 6, scope: !66)
!68 = !DILocation(line: 31, column: 9, scope: !69)
!69 = distinct !DILexicalBlock(scope: !62, file: !1, line: 29, column: 6)
!70 = !DILocation(line: 33, column: 4, scope: !51)
!71 = !DILocation(line: 37, column: 7, scope: !72)
!72 = distinct !DILexicalBlock(scope: !41, file: !1, line: 35, column: 4)
!73 = !DILocation(line: 40, column: 4, scope: !7)
