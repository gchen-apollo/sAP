@echo off
:: For documentation, please refer to "doc\tasks.md"

set "dataDir=D:\Data"

set methodName=mrcnn50_nm
set scale=0.5

python det\srt_det_inf.py ^
	--data-root "%dataDir%\Argoverse-1.1\tracking" ^
	--annot-path "%dataDir%\Argoverse-HD\annotations\val.json" ^
	--fps 30 ^
	--cached-res "%dataDir%\Exp\Argoverse-HD\output\%methodName%_s%scale%\val\results_raw.pkl" ^
	--runtime "%dataDir%\Exp\Argoverse-HD\runtime-zoo\1080ti\%methodName%_s%scale%.pkl" ^
	--out-dir "%dataDir%\Exp\Argoverse-HD\output\srt_%methodName%_inf_s%scale%\val" ^
	--overwrite ^
    && 
python det\streaming_eval.py ^
	--data-root "%dataDir%\Argoverse-1.1\tracking" ^
	--annot-path "%dataDir%\Argoverse-HD\annotations\val.json" ^
	--fps 30 ^
	--eta 0 ^
	--result-dir "%dataDir%\Exp\Argoverse-HD\output\srt_%methodName%_inf_s%scale%\val" ^
	--out-dir "%dataDir%\Exp\Argoverse-HD\output\srt_%methodName%_inf_s%scale%\val" ^
	--overwrite ^
	--vis-dir "%dataDir%\Exp\Argoverse-HD\vis\srt_%methodName%_inf_s%scale%\val" ^
	--vis-scale 0.5 ^
