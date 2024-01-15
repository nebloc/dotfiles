# This file defines overlays
{inputs, ...}: {
  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  # modifications = final: prev: {
  #   # example = prev.example.overrideAttrs (oldAttrs: rec {
  #   # ...
  #   # });
  # };
  modifications = final: prev: {
    azuredatastudio = prev.azuredatastudio.overrideAttrs (finalAttrs: oldAttrs: rec {
      version = "1.47.1";
      src = final.fetchurl {
        name = "${oldAttrs.pname}-${version}.tar.gz";
        url = "https://azuredatastudio-update.azurewebsites.net/${version}/linux-x64/stable";
        sha256 = "sha256-ZreWq7E3AKqsV/qmMC9m2xaK7lBJyI3AGWcn/jlf2KM=";
      };
      sqltoolsservicePath = "${oldAttrs.targetPath}/resources/app/extensions/mssql/sqltoolsservice/Linux/4.10.2.1";
      fixupPhase = ''
    fix_sqltoolsservice()
    {
      mv ${sqltoolsservicePath}/$1 ${sqltoolsservicePath}/$1_old
      patchelf \
        --set-interpreter "${prev.stdenv.cc.bintools.dynamicLinker}" \
        ${sqltoolsservicePath}/$1_old

      makeWrapper \
        ${sqltoolsservicePath}/$1_old \
        ${sqltoolsservicePath}/$1 \
        --set LD_LIBRARY_PATH ${oldAttrs.sqltoolsserviceRpath}
    }

    fix_sqltoolsservice MicrosoftSqlToolsServiceLayer
    fix_sqltoolsservice MicrosoftSqlToolsCredentials
    fix_sqltoolsservice SqlToolsResourceProviderService

    patchelf \
      --set-interpreter "${prev.stdenv.cc.bintools.dynamicLinker}" \
      ${oldAttrs.targetPath}/${oldAttrs.edition}

    mkdir -p $out/bin
    makeWrapper \
      ${oldAttrs.targetPath}/bin/${oldAttrs.edition} \
      $out/bin/azuredatastudio \
      --set LD_LIBRARY_PATH ${oldAttrs.rpath}
  '';
    });
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
