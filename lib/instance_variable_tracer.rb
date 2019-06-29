require "instance_variable_tracer/version"

module InstanceVariableTracer
  # usage: InstanceVariableTracer.start(target_instance_variable_name: "@books")
  def self.start(target_instance_variable_name:, target_class_name: nil)
    TracePoint.trace(:line) do |tp|
      # TracePointで止めてASTを確認し、インスタンス変数への代入かどうかを調べる
      # puts "[TP:#{tp.event}] #{tp.path}:#{tp.lineno} #{tp.method_id} #{tp.defined_class}"
      begin
        line = File.open(tp.path, "r"){|f| f.readlines[tp.lineno - 1] } # TODO: ファイルがないクラスでは使えない
      rescue Errno::ENOENT => e
        # p "File.open error"
        # p tp
        # p tp.path
      end
      next unless line

      # AST取得
      begin
        node = RubyVM::AbstractSyntaxTree.parse(line).children.last
      rescue Exception => e # 乱暴
        next
      end

      # インスタンス変数への代入かを調べる
      next unless node.type == :IASGN

      # クラス名を調べる
      if target_class_name
        target_class = Kernel.const_get(target_class_name)
        next unless tp.self.is_a?(target_class)
      end

      # インスタンス変数名を調べる
      instance_variable_name = node.children.first
      next unless instance_variable_name == target_instance_variable_name.to_sym

      puts "#{target_class_name} #{target_instance_variable_name} is assigned in #{tp.path}:#{tp.lineno} #{tp.method_id} #{tp.defined_class}"
    end
  end
end
