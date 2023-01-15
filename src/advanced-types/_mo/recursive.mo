// RECURSIVE TYPES

type Folder = {
    #OnlyFiles: [Text];
    #FoldersAndFiles: ([Folder], [Text]);
};

