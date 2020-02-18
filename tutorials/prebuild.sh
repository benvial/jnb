#!/bin/bash -v
echo "Prebuilding: Q# samples..."

dotnet build
jupyter nbconvert *qsharp.ipynb --execute --stdout --to markdown --allow-errors  --ExecutePreprocessor.kernel_name=iqsharp --ExecutePreprocessor.timeout=120
jupyter nbconvert *python.ipynb --execute --stdout --to markdown --allow-errors --ExecutePreprocessor.timeout=120


jupyter nbconvert *.ipynb
jupyter nbconvert *.ipynb --to slides
