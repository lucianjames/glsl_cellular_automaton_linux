#pragma once
#include "debugging.h"

class SSBO{
private:
	unsigned int ID;
public:
	SSBO(const void* data, unsigned int size);
	~SSBO();
	void bind(unsigned int shaderID, const char name[]) const;	
};
