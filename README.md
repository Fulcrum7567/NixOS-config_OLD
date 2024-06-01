This is the git repository for my NixOS configuration.

In the flake.nix file is every important option.

In the devices folder are every important information for my different devices.

In the useres folder are every important infotion about my user data like profiles etc.


hierachy of files:

nixosConfigurations:

        ./devices/{currentDevice}/hardware/hardware-configuration.nix                       --> (information about the hardware of the current device)
                                    /\
                                    ||
                ./devices/{currentDevice}/configuration.nix                                 --> (options only the current device has (e.g. drivers etc.))
                                    /\
                                    ||
            ./users/{currentUser}/profiles/global/configuration.nix                         --> (default options for all devices and all profiles (MOST OPTIONS ARE FOUND HERE))
                                    /\
                                    ||
    ./users/{currentUser}/profiles/{currentProfileType}/global/configuration.nix            --> (options for activated profile type)
                                    /\
                                    ||
./users/{currentUser}/profiles/{currentProfileType}/{currentProfile}/configuration.nix      --> (options for activated profile (for themes e.g.))
                                    /\
                                    ||
                                ./flake.nix                                                 --> (main file)
