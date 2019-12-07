#ifndef  _fpulib_loaded_
#define _fpulib_loaded_

#ifdef __cplusplus
extern "C"{
#endif /* __cplusplus */

/* 切り上げ処理 */
extern double _cdecl ceil(double);
/* 切り上げ処理 int 型に変換するため、オーバーフローに注意 */
extern int _cdecl ceil_i(double);

/* 五捨五入処理 */
extern double _cdecl bround(double);
/* 五捨五入処理 int 型に変換するため、オーバーフローに注意 */
extern int _cdecl bround_i(double);

/* 四捨五入処理 */
extern double _cdecl round(double);
/* 四捨五入処理 int 型に変換するため、オーバーフローに注意 */
extern int _cdecl round_i(double);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* _fpulib_loaded_ */
