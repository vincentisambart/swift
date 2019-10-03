// RUN: %empty-directory(%t)
// RUN: %target-swift-frontend -enable-batch-mode -emit-module -emit-module-doc -emit-module-path %t/Foo.swiftmodule %S/Inputs/comments-batch/File1.swift %S/Inputs/comments-batch/File2.swift %S/Inputs/comments-batch/File3.swift %S/Inputs/comments-batch/File4.swift %S/Inputs/comments-batch/File5.swift -module-name Foo -emit-module-source-info-path %t/Foo.swiftsourceinfo -emit-module-doc-path %t/Foo.swiftdoc
// RUN: %target-swift-ide-test -print-module-comments -module-to-print=Foo -source-filename %s -I %t | %FileCheck %s -check-prefix=FIRST

// FIRST: Inputs/comments-batch/File1.swift:2:13: Func/FuncFromFile1 RawComment=[/// Comment in File1\n]
// FIRST: Inputs/comments-batch/File2.swift:2:13: Func/FuncFromFile2 RawComment=[/// Comment in File2\n]
// FIRST: Inputs/comments-batch/File3.swift:2:13: Func/FuncFromFile3 RawComment=[/// Comment in File3\n]
// FIRST: Inputs/comments-batch/File4.swift:2:13: Func/FuncFromFile4 RawComment=[/// Comment in File4\n]
// FIRST: Inputs/comments-batch/File5.swift:2:13: Func/FuncFromFile5 RawComment=[/// Comment in File5\n]
