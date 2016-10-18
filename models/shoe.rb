require 'pg'
require_relative '../db/sql_runner'
class Shoe

  attr_reader( :first_name, :last_name, :address, :size, :quantity, :id )

  def initialize(options)
        @id = nil || options['id'].to_i
        @first_name = options['first_name']
        @last_name = options['last_name']
        @address = options['address']
        @quantity = options['quantity'].to_i
        @size = options['size'].to_i
      end

      def full_name()
        return @first_name.concat(" #{@last_name}")
      end

      def total()
        return @quantity * 10
      end

      def save()
        sql = "INSERT INTO shoes (
          first_name,
          last_name,
          address,
          size,
          quantity ) 
          VALUES (
          '#{ @first_name }',
          '#{ @last_name }',
          '#{ @address }',
          #{ @size },
          #{ @quantity }
          ) RETURNING *"
        shoe_data = SqlRunner.run( sql )
        @id = shoe_data.first()['id'].to_i
      end

      def self.all()
        sql = "SELECT * FROM shoes"
        shoes = SqlRunner.run( sql )
        result = shoes.map { |shoe| Shoe.new( shoe ) }
        return result
      end

    end