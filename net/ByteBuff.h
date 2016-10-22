#ifndef BYTEBUFF_H_B6GWQD5Q
#define BYTEBUFF_H_B6GWQD5Q

#include "Base.h"
#include "Lock.h"

NAMESPACE_BEGIN

class ByteBuff
{
public:
	virtual int write(const BYTE* buf, DWORD size) = 0;
	virtual int read(BYTE* buf, DWORD maxSize) = 0;
	virtual void freeSpace() = 0;
	virtual DWORD getWritePos() = 0;
	virtual DWORD getReadPos() = 0;
	virtual DWORD getDataSize() = 0;
	virtual DWORD getBufferSize() = 0;
};

class BasicByteBuff : public ByteBuff {
public:
	BasicByteBuff();
	BasicByteBuff(DWORD size);
	virtual ~BasicByteBuff();

	virtual int write(const BYTE* buf, DWORD size);
	virtual int read(BYTE* buf, DWORD maxSize);
	virtual void freeSpace();

	virtual DWORD getWritePos();
	virtual DWORD getReadPos();
	virtual DWORD getDataSize();
	virtual DWORD getBufferSize();

private:
	void init(DWORD size);	
	void ensureSpaceEnough(DWORD size);

private:
	BYTE* buffer;
	DWORD bufferSize;
	DWORD dataSize;
	DWORD writePos;
	DWORD readPos;

	Lock lock;
};

NAMESPACE_END
#endif /* end of include guard: BYTEBUFF_H_B6GWQD5Q */
