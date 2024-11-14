import 'package:flutter/material.dart';
import '../../../src/steps/yg_steps.dart';

class StepsDemo extends StatefulWidget {
  const StepsDemo({Key? key}) : super(key: key);

  @override
  State<StepsDemo> createState() => _StepsDemoState();
}

class _StepsDemoState extends State<StepsDemo> {
  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '步骤条 Steps',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '引导用户按照流程完成任务的导航条。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础用法',
          description: '简单的步骤条。',
          demo: Column(
            children: [
              YGSteps(
                current: currentStep,
                steps: [
                  YGStepItem(
                    title: '第一步',
                    description: '完成注册',
                  ),
                  YGStepItem(
                    title: '第二步',
                    description: '填写信息',
                  ),
                  YGStepItem(
                    title: '第三步',
                    description: '完成',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: currentStep > 0
                        ? () {
                            setState(() {
                              currentStep--;
                            });
                          }
                        : null,
                    child: const Text('上一步'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: currentStep < 2
                        ? () {
                            setState(() {
                              currentStep++;
                            });
                          }
                        : null,
                    child: const Text('下一步'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '带图标的步骤条',
          description: '通过设置 icon 属性，可以启用自定义图标。',
          demo: YGSteps(
            steps: [
              YGStepItem(
                title: '登录',
                description: '这是一段描述文字',
                icon: const Icon(Icons.login),
                status: YGStepStatus.finish,
              ),
              YGStepItem(
                title: '验证',
                description: '这是一段描述文字',
                icon: const Icon(Icons.verified_user),
                status: YGStepStatus.process,
              ),
              YGStepItem(
                title: '付款',
                description: '这是一段描述文字',
                icon: const Icon(Icons.payment),
                status: YGStepStatus.wait,
              ),
              YGStepItem(
                title: '完成',
                description: '这是一段描述文字',
                icon: const Icon(Icons.done),
                status: YGStepStatus.wait,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDemoCard({
    required String title,
    required String description,
    required Widget demo,
  }) {
    return Card(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: demo,
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey[200]!,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
