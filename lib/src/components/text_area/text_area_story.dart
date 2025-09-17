import 'package:flutter/material.dart';
import 'app_text_area.dart';
import 'text_area_config.dart';

class TextAreaStory extends StatelessWidget {
  const TextAreaStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppTextArea Story'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildStorySection(
            'Auto-Resize Text Area',
            'Default auto-resizing text area with minimum lines',
            AppTextArea(
              label: 'Auto-Resize Text Area',
              hint: 'Start typing to see auto-resize in action...',
              variant: AppTextAreaVariant.autoResize,
              minLines: 3,
              maxLines: 8,
            ),
          ),
          _buildStorySection(
            'With Helper Text',
            'Text area with helper text and character counter',
            AppTextArea(
              label: 'Text Area with Helper',
              hint: 'Type your message here',
              helperText: 'Please provide detailed information',
              maxLength: 500,
              minLines: 3,
              maxLines: 6,
            ),
          ),
          _buildStorySection(
            'Disabled State',
            'Disabled text area that cannot be edited',
            AppTextArea(
              label: 'Disabled Text Area',
              hint: 'This field is disabled',
              enabled: false,
              minLines: 3,
            ),
          ),
          _buildStorySection(
            'Read-Only State',
            'Read-only text area with content',
            AppTextArea(
              controller: TextEditingController(
                text: 'This is read-only content that cannot be modified. '
                    'The user can select and copy this text but cannot edit it.',
              ),
              label: 'Read-Only Text Area',
              readOnly: true,
              minLines: 3,
            ),
          ),
          _buildStorySection(
            'Error State',
            'Text area with error message',
            AppTextArea(
              label: 'Text Area with Error',
              hint: 'Enter your message',
              errorText: 'This field is required',
              minLines: 3,
            ),
          ),
          _buildStorySection(
            'Loading State',
            'Text area in loading state',
            AppTextArea(
              label: 'Loading Text Area',
              hint: 'Loading...',
              overrideState: AppTextAreaState.loading,
              helperText: 'Please wait while we load the content',
            ),
          ),
          _buildStorySection(
            'Skeleton State',
            'Text area in skeleton loading state',
            AppTextArea(
              label: 'Skeleton Text Area',
              hint: 'Loading...',
              overrideState: AppTextAreaState.skeleton,
              helperText: 'Loading content...',
            ),
          ),
          _buildStorySection(
            'With Icons',
            'Text area with prefix and suffix icons',
            AppTextArea(
              label: 'Text Area with Icons',
              hint: 'Enter your message',
              prefixIcon: Icons.message,
              suffixIcon: Icons.send,
              minLines: 3,
              maxLines: 5,
            ),
          ),
          _buildStorySection(
            'Custom Configuration',
            'Text area with custom configuration',
            AppTextArea(
              label: 'Custom Config Text Area',
              hint: 'Custom styling applied',
              config: const AppTextAreaConfig(
                borderRadius: 16,
                contentPadding: EdgeInsets.all(20),
                minimumHeight: 100,
                borderWidth: 3,
                lineHeight: 24,
              ),
              minLines: 4,
              maxLines: 8,
            ),
          ),
          _buildStorySection(
            'Form Validation',
            'Text area with validation in a form',
            _buildValidationForm(),
          ),
          _buildStorySection(
            'Long Text Content',
            'Text area with pre-filled long content',
            AppTextArea(
              controller: TextEditingController(
                text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                    'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                    'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui '
                    'officia deserunt mollit anim id est laborum.\n\n'
                    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem '
                    'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa '
                    'quae ab illo inventore veritatis et quasi architecto beatae vitae '
                    'dicta sunt explicabo.',
              ),
              label: 'Long Text Content',
              hint: 'Edit the content',
              helperText: 'Scroll to see more content',
              minLines: 5,
              maxLines: 10,
            ),
          ),
          _buildStorySection(
            'RTL Support',
            'Text area with right-to-left text direction',
            AppTextArea(
              label: 'RTL Text Area',
              hint: 'اكتب رسالتك هنا',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              minLines: 3,
              maxLines: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStorySection(String title, String description, Widget child) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildValidationForm() {
    return Form(
      child: Column(
        children: [
          AppTextArea(
            label: 'Required Message',
            hint: 'This field is required',
            validator: AppTextAreaValidator.required,
            minLines: 3,
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          AppTextArea(
            label: 'Minimum 10 Characters',
            hint: 'Enter at least 10 characters',
            validator: AppTextAreaValidator.minLength(10),
            helperText: 'Must be at least 10 characters long',
            minLines: 2,
            maxLines: 4,
          ),
          const SizedBox(height: 16),
          AppTextArea(
            label: 'Maximum 100 Characters',
            hint: 'Enter up to 100 characters',
            validator: AppTextAreaValidator.maxLength(100),
            maxLength: 100,
            helperText: 'Maximum 100 characters allowed',
            minLines: 3,
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          AppTextArea(
            label: 'Minimum 5 Words',
            hint: 'Enter at least 5 words',
            validator: AppTextAreaValidator.minWords(5),
            helperText: 'Must contain at least 5 words',
            minLines: 2,
            maxLines: 4,
          ),
          const SizedBox(height: 16),
          AppTextArea(
            label: 'Combined Validation',
            hint: 'Required field with length constraints',
            validator: AppTextAreaValidator.combine([
              AppTextAreaValidator.required,
              AppTextAreaValidator.minLength(20),
              AppTextAreaValidator.maxLength(200),
            ]),
            maxLength: 200,
            helperText: 'Required, 20-200 characters',
            minLines: 3,
            maxLines: 6,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Validate form
            },
            child: const Text('Validate Form'),
          ),
        ],
      ),
    );
  }
}