#include "ByteBuff.h"

#include <malloc.h>
#include <string.h>

NAMESPACE_BEGIN

BasicByteBuff::BasicByteBuff() {
	init(32);
}

BasicByteBuff::BasicByteBuff(DWORD size) {
	init(size);
}

void BasicByteBuff::init(DWORD size) {
	this->buffer = new BYTE[size];
	this->bufferSize = size;
	this->dataSize = 0;
	this->writePos = 0;
	this->readPos = 0;
}

BasicByteBuff::~BasicByteBuff() {
	if (buffer != nullptr) {
		delete buffer;
	}
}

int BasicByteBuff::write(const BYTE* buf, DWORD size) {
	if (buf == nullptr) {
		return 0;
	}
	if (size == 0) {
		return 0;
	}
	
	AutoWLock awl(lock);
	ensureSpaceEnough(size);
	memcpy(&buffer[writePos], (const void*)buf, size);
	writePos += size;
	dataSize += size;
	return size;
}

int BasicByteBuff::read(BYTE* buf, DWORD maxSize) {
	if (buf == nullptr) {
		return 0;
	}
	if (maxSize == 0) {
		return 0;
	}

	AutoRLock arl(lock);
	int readSize = maxSize > dataSize? dataSize: maxSize;
	memcpy(buf, &this->buffer[readPos], readSize);
	dataSize -= readSize;
	readPos += readSize;
	return readSize;	
}
	
void BasicByteBuff::freeSpace() {
	AutoWLock awl(lock);

	if (dataSize == 0) {
		return;
	}
	memmove(buffer, &buffer[readPos], dataSize);
	writePos -= readPos;
	readPos = 0;
}

void BasicByteBuff::ensureSpaceEnough(DWORD size) {
	if (bufferSize - dataSize >= size) {
		return;
	}
	DWORD doubleSize = bufferSize * 2;
	DWORD needSize = dataSize + size;
	DWORD newSize = doubleSize > needSize ? doubleSize : needSize;
	buffer = (BYTE*)realloc(buffer, newSize);
	bufferSize = newSize;
}

DWORD BasicByteBuff::getWritePos() {
	return this->writePos;
}

DWORD BasicByteBuff::getReadPos() {
	return this->readPos;
}

DWORD BasicByteBuff::getDataSize() {
	return this->dataSize;
}

DWORD BasicByteBuff::getBufferSize() {
	return this->bufferSize;
}


NAMESPACE_END
