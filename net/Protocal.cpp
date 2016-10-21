#include "Protocal.h"
#include "Socket.h"

NAMESPACE_BEGIN

int Protocal::send(Socket* socket, BYTE* data, DWORD size) {
	ProtocalHeader header(size, 0);
	socket->send((BYTE*)&header, sizeof(header));
	return socket->send(data, size);
}
	
int Protocal::sendToBuf(Socket* socket, BYTE* data, DWORD size) {
	ProtocalHeader header(size, 0);
	socket->sendToBuf((BYTE*)&header, sizeof(header));
	return socket->sendToBuf(data, size);
}

int Protocal::recv(Socket* socket, BYTE* buf, DWORD maxSize) {
	ProtocalHeader header;
	int ret = socket->recv((BYTE*)&header, sizeof(header));
	if (ret != 0 && ret != sizeof(header)) {
		printf("recv, not enough data for protocal header.\n");	
		return -1;
	}
	ret = socket->recv(buf, header.dataLen);
	if (ret != header.dataLen) {
		printf("recv, not enough data for packet.\n");	
		return -1;
	}
	return ret;
}

NAMESPACE_END
