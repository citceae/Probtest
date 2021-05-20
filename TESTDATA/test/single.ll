; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @myfunc2(i32 %x) #0 !dbg !7 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %x.addr, align 4, !dbg !13
  %cmp = icmp sge i32 %0, 9900, !dbg !15
  br i1 %cmp, label %if.then, label %if.else6, !dbg !16

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %x.addr, align 4, !dbg !17
  %cmp1 = icmp sge i32 %1, 9950, !dbg !20
  br i1 %cmp1, label %if.then2, label %if.else5, !dbg !21

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %x.addr, align 4, !dbg !22
  %cmp3 = icmp sge i32 %2, 9990, !dbg !25
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !26

if.then4:                                         ; preds = %if.then2
  br label %return, !dbg !27

if.else:                                          ; preds = %if.then2
  br label %return, !dbg !29

if.else5:                                         ; preds = %if.then
  br label %return, !dbg !31

if.else6:                                         ; preds = %entry
  br label %return, !dbg !33

return:                                           ; preds = %if.else6, %if.else5, %if.else, %if.then4
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %a, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %b, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !50
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !50
  %call = call i32 @atoi(i8* %1) #3, !dbg !51
  store i32 %call, i32* %a, align 4, !dbg !52
  %2 = load i32, i32* %a, align 4, !dbg !53
  call void @myfunc2(i32 %2), !dbg !54
  ret i32 0, !dbg !55
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
!1 = !DIFile(filename: "test.c", directory: "/home/citceae/Probtest/ver1/source/func3/TESTDATA/test")
!2 = !{}
!3 = !{!"clang version 12.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 21d64c32eca63e98a94675cfc074f82371cadfe7)"}
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = distinct !DISubprogram(name: "myfunc2", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 4, column: 18, scope: !7)
!13 = !DILocation(line: 5, column: 9, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 9)
!15 = !DILocation(line: 5, column: 10, scope: !14)
!16 = !DILocation(line: 5, column: 9, scope: !7)
!17 = !DILocation(line: 6, column: 9, scope: !18)
!18 = distinct !DILexicalBlock(scope: !19, file: !1, line: 6, column: 9)
!19 = distinct !DILexicalBlock(scope: !14, file: !1, line: 5, column: 17)
!20 = !DILocation(line: 6, column: 10, scope: !18)
!21 = !DILocation(line: 6, column: 9, scope: !19)
!22 = !DILocation(line: 7, column: 13, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 7, column: 13)
!24 = distinct !DILexicalBlock(scope: !18, file: !1, line: 6, column: 17)
!25 = !DILocation(line: 7, column: 14, scope: !23)
!26 = !DILocation(line: 7, column: 13, scope: !24)
!27 = !DILocation(line: 8, column: 11, scope: !28)
!28 = distinct !DILexicalBlock(scope: !23, file: !1, line: 7, column: 21)
!29 = !DILocation(line: 11, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !1, line: 10, column: 14)
!31 = !DILocation(line: 15, column: 10, scope: !32)
!32 = distinct !DILexicalBlock(scope: !18, file: !1, line: 14, column: 10)
!33 = !DILocation(line: 19, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !14, file: !1, line: 18, column: 9)
!35 = !DILocation(line: 21, column: 1, scope: !7)
!36 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 23, type: !37, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!10, !10, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !1, line: 23, type: !10)
!43 = !DILocation(line: 23, column: 14, scope: !36)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !1, line: 23, type: !39)
!45 = !DILocation(line: 23, column: 26, scope: !36)
!46 = !DILocalVariable(name: "a", scope: !36, file: !1, line: 24, type: !10)
!47 = !DILocation(line: 24, column: 9, scope: !36)
!48 = !DILocalVariable(name: "b", scope: !36, file: !1, line: 24, type: !10)
!49 = !DILocation(line: 24, column: 11, scope: !36)
!50 = !DILocation(line: 25, column: 14, scope: !36)
!51 = !DILocation(line: 25, column: 9, scope: !36)
!52 = !DILocation(line: 25, column: 7, scope: !36)
!53 = !DILocation(line: 26, column: 13, scope: !36)
!54 = !DILocation(line: 26, column: 5, scope: !36)
!55 = !DILocation(line: 28, column: 5, scope: !36)
