#ifndef BASE_H_KJXVIF56
#define BASE_H_KJXVIF56

#define NAMESPACE_BEGIN namespace net {
#define NAMESPACE_END }


NAMESPACE_BEGIN

typedef	unsigned long long QWORD;
typedef unsigned int DWORD;
typedef unsigned short WORD;
typedef unsigned char BYTE;

static bool isSetFlag(int val, int flag) {
	return val & flag;
}

static void setFlag(int& val, int flag) {
	val =  val | flag;
}

static void clearFlag(int& val, int flag) {
	val = val & (~flag);
}

NAMESPACE_END

#endif /* end of include guard: BASE_H_KJXVIF56 */
