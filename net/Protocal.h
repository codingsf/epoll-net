#ifndef PROTOCAL_H_PTFWG8LJ
#define PROTOCAL_H_PTFWG8LJ

#include "Base.h"

NAMESPACE_BEGIN

struct ProtocalHeader {
	ProtocalHeader() {
		dataLen = 0;
		flags = 0;
		reserv.reservea = 0;
		reserv.reserveb = 0;
	}

	ProtocalHeader(DWORD datalen, BYTE flags) {
		this->dataLen = datalen;
		this->flags = flags;
		reserv.reservea = 0;
		reserv.reserveb = 0;
	}
	DWORD dataLen;
	BYTE flags;
	struct reserve {
		BYTE reservea;
		WORD reserveb;
	} reserv;
};

#define COMPRESSED 1;
#define MAX_DATALEN 81920
#define HEADER_LEN sizeof(ProtocalHeader)
#define MIN_DATA_LEN HEADER_LEN

class Socket;
class Protocal {
public:
	static int send(Socket* socket, BYTE* data, DWORD size);
	static int sendToBuf(Socket* socket, BYTE* data, DWORD size);
	static int recv(Socket* socket, BYTE* buf, DWORD maxSize);
};

NAMESPACE_END

#endif /* end of include guard: PROTOCAL_H_PTFWG8LJ */
