#ifndef  _fpulib_loaded_
#define _fpulib_loaded_

#ifdef __cplusplus
extern "C"{
#endif /* __cplusplus */

/* �؂�グ���� */
extern double _cdecl ceil(double);
/* �؂�グ���� int �^�ɕϊ����邽�߁A�I�[�o�[�t���[�ɒ��� */
extern int _cdecl ceil_i(double);

/* �܎̌ܓ����� */
extern double _cdecl bround(double);
/* �܎̌ܓ����� int �^�ɕϊ����邽�߁A�I�[�o�[�t���[�ɒ��� */
extern int _cdecl bround_i(double);

/* �l�̌ܓ����� */
extern double _cdecl round(double);
/* �l�̌ܓ����� int �^�ɕϊ����邽�߁A�I�[�o�[�t���[�ɒ��� */
extern int _cdecl round_i(double);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* _fpulib_loaded_ */
