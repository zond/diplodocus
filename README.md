# diplodocus

A client to https://github.com/zond/diplicity

## Local development

Install Flutter: https://flutter.dev/docs/get-started/install.

Note that there's a GitHub action that runs `flutter format .` after each push, so to avoid getting merge issues with your own commits make sure to do the same, e.g. via a git hook:

```
cat > .git/hooks/pre-commit <<EOF
#!/usr/bin/bash
flutter format .
EOF
chmod +x .git/hooks/pre-commit
```
