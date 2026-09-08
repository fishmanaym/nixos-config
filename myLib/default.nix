{lib, ...}: {
  getHjemFiles = dir: let
    pathList = lib.filesystem.listFilesRecursive dir;
    pathToRelativeString = path: lib.strings.removePrefix (toString dir + "/") (toString path);
    pathToHjemFile = path: {
      name = pathToRelativeString path;
      value = {source = path;};
    };
  in
    builtins.listToAttrs (map pathToHjemFile pathList);
}
