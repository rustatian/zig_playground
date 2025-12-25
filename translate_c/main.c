#include <stdint.h>

#define GGML_MAX_OP_PARAMS 64

struct ggml_tensor
{
	int32_t op_params[GGML_MAX_OP_PARAMS / sizeof(int32_t)];
	struct ggml_tensor *src[4];
};

struct ggml_context;

struct simple_model
{
	struct ggml_tensor *a;
	struct ggml_tensor *b;

	struct ggml_context *ctx;
};

void load_model(struct simple_model *model)
{
	model->a = (struct ggml_tensor *)0x1234;
	return;
}

int main()
{
	struct simple_model model;
	load_model(&model);
	return 0;
}
