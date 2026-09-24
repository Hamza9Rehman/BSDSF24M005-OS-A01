Feature 2


Explain the linking rule in this part's Makefile: $(TARGET): $(OBJECTS). How does it differ from a Makefile rule that links against a library?

$(TARGET): $(OBJECTS) is the dependency line for linking an executable binary file directly from compiled object files.
The differences with linking to a library file are file type is .o for object files while it is .a or .so for static and/or dynamic library files.
The syntax for object files is plain filename.o while you have to add flag -L for libraries.


What is a git tag and why is it useful in a project? What is the difference between a simple tag and an annotated tag?

A git tag is a pointer to a specific point in a repository's commit history. It is commonly used to mark stable release points in a software development journey.
A simple tag is basically just a named pointer to a point in the commit history, while an annotated tag contains metadata such as tagger's name, email, tag message etc.


What is the purpose of creating a "Release" on GitHub? What is the significance of attaching binaries (like your client executable) to it?

A github release packages a tagged commit with user facing documentation about the provided software, such as changelogs and release notes. It basically provides extra information about the software to the end user.
Adding binaries helps provide end users with a precompiled executable product, so they dont have to install compilers etc. This also helps save any issues that might have come from different users trying to compile code in different environments.


Feature 3


Compare the Makefile from Part 2 and Part 3. What are the key differences in the variables and rules that enable the creation of a static library?

Makefile 2 focuses on making .o files from .c files and then linking them with main.o directly, while Makefile 3 makes .o files, combines them into static library and then links main.o with the library file.
The main differences in variables are that Makefile 3 adds variables for ar and its flags. The target variables also have differing dependencies. Linking rule is straighforward in Makefile 2 with executable being formed by linking .o files, while there are additional library flags in Makefile 3.


What is the purpose of the ar command? Why is ranlib often used immediately after it?

The ar command combines multiple .o files into a static library. Ranlib creates an index of contents and stores it into the .a file, for faster searching of functions in the static library.


When you run nm on your client_static executable, are the symbols for functions like mystrlen present? What does this tell you about how static linking works?

Symbols are present with a T code, indicating that the machine code for functions was copied directly into the executable.