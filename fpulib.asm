; �I�u�W�F�N�g�t�@�C������A���C�u�����t�@�C�����쐬����ɂ́A
; lib �R�}���h�𗘗p���� ( lib.exe /out:fpulib.lib fpulib.obj )

; ���� MODEL �̋L�q�̏ꍇ�A�Ăяo���K��� cdecl �ƂȂ�
; �Ăяo���K��� stdcall ���g���ꍇ�́A���̂悤�� MODEL ��錾����
; .MODEL flat, stdcall
.586
.MODEL flat, C
.DATA
f05         dd 0.5

.CODE
; �܎̌ܓ����āAint ( 32bit ���� ) �Œl��Ԃ�
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

; �܎̌ܓ����āAdouble �Œl��Ԃ�
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

; �l�̌ܓ����āAint �Œl��Ԃ�
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

; �l�̌ܓ����āAdouble �Œl��Ԃ�
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

; �؂�グ�āAint �Œl��Ԃ�
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

; �؂�グ�āAdouble �Œl��Ԃ�
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