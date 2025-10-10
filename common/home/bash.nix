{...}: {
  home.shellAliases = {
    g = "git";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
          # A function to create a text file with specific content and a name derived from an file.
      #
      # @param {string} $1 - The name of the file, which will be used to construct the hdv filename.
      # @param {string} $2 - The content to be written to the hdv file. This should be a single string,
      #                      so it's best to enclose it in quotes when calling the function.
      #
      hdv_file() {
        # Check if the required arguments have been provided.
        if [ -z "$1" ] || [ -z "$2" ]; then
          echo "Usage: hdv_file <file_name> \"<content>\""
          return 1
        fi

        local file_name="$1"
        local content="$2"
        local hdv_name="''${file_name}_hdv.txt"

        # The echo command writes the content to the specified file.
        echo "$content" > "$hdv_name"

        echo "File created: $hdv_name"
      }
    '';
  };
}
