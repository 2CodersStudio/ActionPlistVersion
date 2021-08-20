# Obtain-version
Obtain the version in the plist file

Use in workflow as follows:

        - uses: 2CodersStudio/ActionPlistVersion@main
        id: plistVersion
        with:
          plist-path: PathToInfoPlistFolder/Info.plist
          key: CFBundleShortVersionString
        - name: Get Version
        run: echo Version ${{ steps.plistVersion.outputs.version }}"
