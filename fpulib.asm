; オブジェクトファイルから、ライブラリファイルを作成するには、
; lib コマンドを利用する ( lib.exe /out:fpulib.lib fpulib.obj )

; この MODEL の記述の場合、呼び出し規約は cdecl となる
; 呼び出し規約に stdcall を使う場合は、次のように MODEL を宣言する
; .MODEL flat, stdcall
.586
.MODEL flat, C
.DATA
f05         dd 0.5

.CODE
; 五捨五入して、int ( 32bit 整数 ) で値を返す
; extern int _cdecl bround_i(double);
bround_i PROC val:REAL8
	fstcw   [esp-4]
	mov     word ptr [esp-2], 03fh
	fld     qword ptr val
	fistp   dword ptr val
	mov     eax, dword ptr val
	fldcw   [esp-4]
	ret
bround_i  ENDP

; 五捨五入して、double で値を返す
; extern double _cdecl bround(double);
bround PROC val:REAL8
	fstcw   [esp-4]
	mov     word ptr [esp-2], 03fh
	fldcw   [esp-2]
	fld      qword ptr val
	frndint
	fldcw   [esp-4]
	ret
bround ENDP

; 四捨五入して、int で値を返す
; extern int _cdecl round(double);
round_i PROC val:REAL8
	fstcw   [esp-4]
	mov     word ptr [esp-2], 043fh
	fldcw   [esp-2]
	fld     qword ptr val
	fadd    f05
	fistp   dword ptr val
	mov     eax, dword ptr val
	fldcw   [esp-4]
	ret
round_i ENDP

; 四捨五入して、double で値を返す
; extern double _cdecl round(double);
round PROC val:REAL8
	fstcw   [esp-4]
	mov     word ptr [esp-2], 043fh
	fldcw   [esp-2]
	fld     qword ptr val
	fadd    f05
	frndint
	fldcw   [esp-4]
	ret
round ENDP

; 切り上げて、int で値を返す
; extern int _cdecl ceil_i(double);
ceil_i PROC, val:REAL8
	fstcw   [esp-4]
	mov     word ptr [esp-2], 083fh
	fldcw   [esp-2]
	fld     qword ptr val
	fistp   dword ptr val
	mov     eax, dword ptr val
	fldcw   [esp-4]
	ret
ceil_i ENDP

; 切り上げて、double で値を返す
; extern double _cdecl ceil(double);
ceil PROC, val:REAL8
	fstcw   [esp-4]
	mov     word ptr [esp-2], 083fh
	fldcw   [esp-2]
	fld     val
	frndint
	fldcw   [esp-4]
	ret
ceil ENDP

END